extends CharacterBody2D

@export var move_speed: float = 320.0
@export var arena_margin: float = 48.0

var target_x: float

func _ready() -> void:
	target_x = position.x

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("touch_move_left"):
		target_x -= move_speed * delta
	if Input.is_action_pressed("touch_move_right"):
		target_x += move_speed * delta

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		target_x = get_global_mouse_position().x

	target_x = clamp(target_x, arena_margin, 720.0 - arena_margin)
	velocity.x = (target_x - position.x) * 10.0
	velocity.y = 0.0
	move_and_slide()
