extends Node2D

const DURATION := 0.28
var elapsed := 0.0
var start_radius := 8.0
var end_radius := 34.0

func _ready() -> void:
	z_index = 20
	queue_redraw()

func _process(delta: float) -> void:
	elapsed += delta
	queue_redraw()
	if elapsed >= DURATION:
		queue_free()

func _draw() -> void:
	var progress := clampf(elapsed / DURATION, 0.0, 1.0)
	var radius := lerpf(start_radius, end_radius, progress)
	var alpha := 1.0 - progress
	var width := lerpf(4.0, 1.0, progress)
	draw_circle(Vector2.ZERO, radius, Color(1.0, 0.45, 0.18, alpha * 0.12))
	draw_arc(Vector2.ZERO, radius, 0.0, TAU, 24, Color(1.0, 0.48, 0.20, alpha), width)
	draw_line(Vector2(-radius * 0.55, 0.0), Vector2(radius * 0.55, 0.0), Color(1.0, 0.72, 0.32, alpha), width)
	draw_line(Vector2(0.0, -radius * 0.55), Vector2(0.0, radius * 0.55), Color(1.0, 0.72, 0.32, alpha), width)
