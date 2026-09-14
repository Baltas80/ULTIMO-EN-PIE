extends Node2D

const PLAYER_SCENE := preload("res://scenes/player.tscn")
const BOT_SCENE := preload("res://scenes/bot.tscn")

const BOT_SPAWN_POSITIONS := [
	Vector2(160.0, 420.0),
	Vector2(360.0, 560.0),
	Vector2(560.0, 700.0)
]

func _ready() -> void:
	_spawn_player()
	_spawn_bots()

func _spawn_player() -> void:
	var player := PLAYER_SCENE.instantiate()
	player.position = Vector2(360.0, 900.0)
	add_child(player)

func _spawn_bots() -> void:
	for index in BOT_SPAWN_POSITIONS.size():
		var bot := BOT_SCENE.instantiate()
		bot.position = BOT_SPAWN_POSITIONS[index]
		bot.lane_y = BOT_SPAWN_POSITIONS[index].y
		bot.phase = float(index) * 0.7
		add_child(bot)
