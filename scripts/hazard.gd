extends Area2D

@export var start_y: float = 220.0
@export var end_y: float = 1080.0
@export var descent_speed: float = 90.0
@export var acceleration: float = 6.0
@export var cycle_speed_step: float = 12.0

var elapsed := 0.0
var cycle_index := 0
var current_speed := 0.0
var main_controller: Node = null
@onready var core: Polygon2D = $Core
var visual_time := 0.0

func _ready() -> void:
	monitoring = true
	monitorable = true
	position.y = start_y
	current_speed = descent_speed
	main_controller = get_parent()

func _process(delta: float) -> void:
	visual_time += delta
	var pulse := 1.0 + 0.10 * sin(visual_time * 5.0)
	core.scale.x = pulse
	core.scale.y = pulse

func _physics_process(delta: float) -> void:
	elapsed += delta
	current_speed = descent_speed + float(cycle_index) * cycle_speed_step + acceleration * elapsed
	position.y += current_speed * delta
	if position.y >= end_y:
		position.y = start_y
		elapsed = 0.0
		cycle_index += 1
		current_speed = descent_speed + float(cycle_index) * cycle_speed_step

func eliminate_participant(body: Node) -> void:
	if body.has_method("eliminate"):
		if main_controller and main_controller.has_method("register_elimination"):
			main_controller.register_elimination(body)
		body.eliminate()
