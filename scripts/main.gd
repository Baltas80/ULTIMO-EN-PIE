extends Node2D

const PLAYER_SCENE := preload("res://scenes/player.tscn")
const BOT_SCENE := preload("res://scenes/bot.tscn")
const HAZARD_SCENE := preload("res://scenes/hazard.tscn")

const BOT_SPAWN_POSITIONS := [
	Vector2(160.0, 420.0),
	Vector2(360.0, 560.0),
	Vector2(560.0, 700.0)
]

var participants: Array[Node] = []
var match_active := true
var match_time := 0.0
var finish_position := 0

func _ready() -> void:
	_spawn_player()
	_spawn_bots()
	_spawn_hazard()
	_refresh_participants()

func _process(delta: float) -> void:
	if not match_active:
		return
	match_time += delta
	_refresh_participants()
	if participants.size() <= 1:
		_end_match()

func _spawn_player() -> void:
	var player := PLAYER_SCENE.instantiate()
	player.position = Vector2(360.0, 900.0)
	add_child(player)
	participants.append(player)

func _spawn_bots() -> void:
	for index in range(BOT_SPAWN_POSITIONS.size()):
		var bot := BOT_SCENE.instantiate()
		var spawn_position: Vector2 = BOT_SPAWN_POSITIONS[index]
		bot.position = spawn_position
		bot.lane_y = spawn_position.y
		bot.phase = float(index) * 0.7
		add_child(bot)
		participants.append(bot)

func _spawn_hazard() -> void:
	var hazard := HAZARD_SCENE.instantiate()
	hazard.position = Vector2(360.0, 220.0)
	add_child(hazard)

func _refresh_participants() -> void:
	participants = participants.filter(func(item: Node) -> bool: return is_instance_valid(item) and item.is_inside_tree())

func _end_match() -> void:
	match_active = false
	finish_position = 1 if participants.size() == 1 else 0
	var status := get_node_or_null("Status")
	if status:
		status.text = "PARTIDA TERMINADA · POSICIÓN %d · %.1fs" % [finish_position, match_time]
