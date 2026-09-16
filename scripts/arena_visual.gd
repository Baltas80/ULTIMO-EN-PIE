extends Node2D

const ARENA_SIZE := Vector2(624.0, 940.0)
const CENTER := Vector2(312.0, 470.0)
const OUTER_RING_COLOR := Color(0.12, 0.17, 0.23, 0.65)
const RADIAL_COLOR := Color(0.10, 0.14, 0.20, 0.55)
const BORDER_COLOR := Color("273447")

var visual_time := 0.0

func _ready() -> void:
	queue_redraw()

func _process(delta: float) -> void:
	visual_time += delta
	queue_redraw()

func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, ARENA_SIZE), Color("080b12"), true)
	for radius in [410.0, 320.0, 230.0, 140.0]:
		draw_arc(CENTER, radius, 0.0, TAU, 96, OUTER_RING_COLOR, 2.0)
	for index in range(12):
		var angle := TAU * float(index) / 12.0
		var end_point := CENTER + Vector2(cos(angle), sin(angle)) * 455.0
		draw_line(CENTER, end_point, RADIAL_COLOR, 1.0)

	var pulse := 0.5 + 0.5 * sin(visual_time * 2.4)
	var core_radius := 34.0 + pulse * 3.0
	var outer_alpha := 0.65 + pulse * 0.18
	var inner_alpha := 0.82 + pulse * 0.14

	draw_circle(CENTER, 74.0, Color("111824"))
	draw_arc(CENTER, 74.0, 0.0, TAU, 72, Color(1.0, 0.24, 0.27, outer_alpha), 5.0)
	draw_circle(CENTER, core_radius + 8.0, Color(1.0, 0.45, 0.12, 0.08 + pulse * 0.06))
	draw_circle(CENTER, core_radius, Color("07090e"))
	draw_arc(CENTER, core_radius, 0.0, TAU, 48, Color(1.0, 0.60, 0.20, inner_alpha), 3.0)

	for offset in [Vector2(-210, -250), Vector2(210, -250), Vector2(-210, 250), Vector2(210, 250)]:
		var rect := Rect2(CENTER + offset - Vector2(52, 18), Vector2(104, 36))
		draw_rect(rect, Color("182231"), true)
		draw_line(rect.position, rect.position + Vector2(rect.size.x, 0), Color("ff9a35"), 3.0)

	draw_rect(Rect2(Vector2(2, 2), ARENA_SIZE - Vector2(4, 4)), BORDER_COLOR, false, 4.0)
	draw_rect(Rect2(Vector2(8, 8), ARENA_SIZE - Vector2(16, 16)), Color(0.10, 0.16, 0.24, 0.7), false, 1.0)
