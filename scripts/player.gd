extends CharacterBody2D

@export var follow_strength: float = 12.0
@export var arena_margin: float = 72.0

var target_x: float
var active := true

func _ready() -> void:
	target_x = position.x

func _unhandled_input(event: InputEvent) -> void:
	if not active:
		return
	if event is InputEventScreenTouch and event.pressed:
		target_x = event.position.x
	elif event is InputEventScreenDrag:
		target_x = event.position.x
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		target_x = event.position.x
	elif event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		target_x = event.position.x

func _physics_process(delta: float) -> void:
	if not active:
		return
	target_x = clamp(target_x, arena_margin, 720.0 - arena_margin)
	position.x = move_toward(position.x, target_x, 420.0 * follow_strength * delta)
	position.y = clamp(position.y, 220.0, 1080.0)

func eliminate() -> void:
	if not active:
		return
	active = false
	set_physics_process(false)
	queue_free()
