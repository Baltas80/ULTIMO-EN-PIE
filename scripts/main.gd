extends Node2D

const PLAYER_SCENE := preload("res://scenes/player.tscn")
const BOT_SCENE := preload("res://scenes/bot.tscn")
const HAZARD_SCENE := preload("res://scenes/hazard.tscn")

const TOTAL_PARTICIPANTS := 50
const ARENA_LEFT := 72.0
const ARENA_RIGHT := 648.0
const ARENA_TOP := 220.0
const ARENA_BOTTOM := 1080.0
const BOT_LANE_COUNT := 7

var participants: Array[Node] = []
var player: Node = null
var match_active := true
var match_time := 0.0
var finish_position := 0
var elimination_count := 0
var player_eliminated := false

func _ready() -> void:
	_spawn_player()
	_spawn_bots(TOTAL_PARTICIPANTS - 1)
	_spawn_hazard()
	_refresh_participants()
	_update_status()

func _process(delta: float) -> void:
	if not match_active:
		return
	match_time += delta
	_refresh_participants()
	if participants.size() <= 1:
		_end_match()
	else:
		_update_status()

func _spawn_player() -> void:
	player = PLAYER_SCENE.instantiate()
	player.position = Vector2(360.0, 900.0)
	add_child(player)
	participants.append(player)

func _spawn_bots(count: int) -> void:
	for index in range(count):
		var bot := BOT_SCENE.instantiate()
		var lane := index % BOT_LANE_COUNT
		var lane_y := ARENA_TOP + 80.0 + float(lane) * 115.0
		var phase := fmod(float(index) * 0.37, 2.0)
		var spawn_x := ARENA_LEFT + fmod(float(index) * 113.0, ARENA_RIGHT - ARENA_LEFT)
		bot.position = Vector2(spawn_x, lane_y)
		bot.lane_y = lane_y
		bot.phase = phase
		bot.move_speed = 105.0 + float(index % 5) * 18.0
		bot.direction_hold_time = 2.6 + float(index % 4) * 0.45
		add_child(bot)
		participants.append(bot)

func _spawn_hazard() -> void:
	var hazard := HAZARD_SCENE.instantiate()
	hazard.position = Vector2(360.0, ARENA_TOP)
	add_child(hazard)

func _refresh_participants() -> void:
	participants = participants.filter(func(item: Node) -> bool: return is_instance_valid(item) and item.is_inside_tree())

func _update_status() -> void:
	var status := get_node_or_null("Status")
	if status:
		status.text = "PARTICIPANTES %02d/%02d · %.1fs" % [participants.size(), TOTAL_PARTICIPANTS, match_time]

func register_elimination(body: Node) -> void:
	if not match_active:
		return
	elimination_count += 1
	if body == player:
		player_eliminated = true
		finish_position = TOTAL_PARTICIPANTS - elimination_count + 1
		_end_match()

func _end_match() -> void:
	if not match_active:
		return
	match_active = false
	if participants.size() == 1 and not player_eliminated:
		finish_position = 1
	var status := get_node_or_null("Status")
	if status:
		if player_eliminated:
			status.text = "ELIMINADO · POSICIÓN %d · %.1fs" % [finish_position, match_time]
		else:
			status.text = "PARTIDA TERMINADA · POSICIÓN %d · %.1fs" % [finish_position, match_time]
