extends CharacterBody2D

@export var move_speed: float = 150.0
@export var arena_left: float = 72.0
@export var arena_right: float = 648.0
@export var lane_y: float = 0.0
@export var phase: float = 0.0

var direction := 1.0
var active := true

func _ready() -> void:
	position.y = lane_y
	phase = fmod(phase, 2.0)
	if phase >= 1.0:
		direction = -1.0

func _physics_process(delta: float) -> void:
	if not active:
		return

	position.x += direction * move_speed * delta
	if position.x <= arena_left:
		position.x = arena_left
		direction = 1.0
	elif position.x >= arena_right:
		position.x = arena_right
		direction = -1.0

func eliminate() -> void:
	if not active:
		return
	active = false
	set_physics_process(false)
	queue_free()
