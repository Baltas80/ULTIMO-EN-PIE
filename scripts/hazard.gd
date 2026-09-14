extends Area2D

@export var speed: float = 110.0
@export var top_y: float = 220.0
@export var bottom_y: float = 1080.0

var active := true

func _ready() -> void:
	monitoring = true
	monitorable = true

func _physics_process(delta: float) -> void:
	if not active:
		return
	position.y += speed * delta
	if position.y > bottom_y:
		position.y = top_y

func eliminate_participant(body: Node) -> void:
	if body.has_method("eliminate"):
		body.eliminate()

func stop() -> void:
	active = false
	set_physics_process(false)
