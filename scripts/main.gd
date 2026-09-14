extends Node2D

const PLAYER_SCENE := preload("res://scenes/player.tscn")

func _ready() -> void:
	var player := PLAYER_SCENE.instantiate()
	player.position = Vector2(360.0, 900.0)
	add_child(player)
