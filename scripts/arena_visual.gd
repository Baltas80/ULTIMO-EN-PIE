extends Node2D

const ARENA_SIZE := Vector2(624.0, 940.0)
const CENTER := Vector2(312.0, 470.0)

func _ready() -> void:
	queue_redraw()

func _draw() -> void:
	# Layered arena floor.
	draw_rect(Rect2(Vector2.ZERO, ARENA_SIZE), Color("080b12"), true)
	for radius in [410.0, 320.0, 230.0, 140.0]:
		draw_arc(CENTER, radius, 0.0, TAU, 96, Color(0.12, 0.17, 0.23, 0.65), 2.0)

	# Structural radial lines provide depth without external assets.
	for index in range(12):
		var angle := TAU * float(index) / 12.0
		var end_point := CENTER + Vector2(cos(angle), sin(angle)) * 455.0
		draw_line(CENTER, end_point, Color(0.10, 0.14, 0.20, 0.55), 1.0)

	# Central hazard mechanism.
	draw_circle(CENTER, 74.0, Color("111824"))
	draw_arc(CENTER, 74.0, 0.0, TAU, 72, Color("ff3d45"), 5.0)
	draw_circle(CENTER, 34.0, Color("07090e"))
	draw_arc(CENTER, 34.0, 0.0, TAU, 48, Color("ff9a35"), 3.0)

	# Four cover blocks.
	for offset in [Vector2(-210, -250), Vector2(210, -250), Vector2(-210, 250), Vector2(210, 250)]:
		var rect := Rect2(CENTER + offset - Vector2(52, 18), Vector2(104, 36))
		draw_rect(rect, Color("182231"), true)
		draw_line(rect.position, rect.position + Vector2(rect.size.x, 0), Color("ff9a35"), 3.0)

	# Arena border.
	draw_rect(Rect2(Vector2(2, 2), ARENA_SIZE - Vector2(4, 4)), Color("273447"), false, 4.0)
	draw_rect(Rect2(Vector2(8, 8), ARENA_SIZE - Vector2(16, 16)), Color(0.10, 0.16, 0.24, 0.7), false, 1.0)
