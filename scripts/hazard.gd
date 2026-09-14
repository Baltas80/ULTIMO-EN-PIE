extends Area2D

@export var radius: float = 34.0

func _ready() -> void:
	monitoring = true
	monitorable = true

func eliminate_participant(body: Node) -> void:
	if body.has_method("eliminate"):
		body.eliminate()
