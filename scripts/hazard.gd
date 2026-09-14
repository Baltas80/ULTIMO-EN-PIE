extends Area2D

@export var start_y: float = 220.0
@export var end_y: float = 1080.0
@export var descent_speed: float = 90.0
@export var acceleration: float = 6.0

var elapsed := 0.0
var current_speed := 0.0
var main_controller: Node = null

func _ready() -> void:
	monitoring = true
	monitorable = true
	position.y = start_y
	current_speed = descent_speed
	main_controller = get_parent()

func _physics_process(delta: float) -> void:
	elapsed += delta
	current_speed = descent_speed + acceleration * elapsed
	position.y += current_speed * delta
	if position.y >= end_y:
		position.y = start_y
		elapsed = 0.0
		current_speed = descent_speed

func eliminate_participant(body: Node) -> void:
	if body.has_method("eliminate"):
		if main_controller and main_controller.has_method("register_elimination"):
			main_controller.register_elimination(body)
		body.eliminate()
