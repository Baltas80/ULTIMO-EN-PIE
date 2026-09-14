extends Node2D

const PLAYER_SCENE := preload("res://scenes/player.tscn")
const BOT_SCENE := preload("res://scenes/bot.tscn")
const HAZARD_SCENE := preload("res://scenes/hazard.tscn")

const BOT_SPAWN_POSITIONS := [
	Vector2(160.0, 420.0),
	Vector2(360.0, 560.0),
	Vector2(560.0, 700.0)
]

func _ready() -> void:
	_spawn_player()
	_spawn_bots()
	_spawn_hazard()

func _spawn_player() -> void:
	var player := PLAYER_SCENE.instantiate()
	player.position = Vector2(360.0, 900.0)
	add_child(player)

func _spawn_bots() -> void:
	for index in range(BOT_SPAWN_POSITIONS.size()):
		var bot := BOT_SCENE.instantiate()
		var spawn_position: Vector2 = BOT_SPAWN_POSITIONS[index]
		bot.position = spawn_position
		bot.lane_y = spawn_position.y
		bot.phase = float(index) * 0.7
		add_child(bot)

func _spawn_hazard() -> void:
	var hazard := HAZARD_SCENE.instantiate()
	hazard.position = Vector2(360.0, 220.0)
	add_child(hazard)
