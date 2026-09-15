extends Node2D

const PLAYER_SCENE := preload("res://scenes/player.tscn")
const BOT_SCENE := preload("res://scenes/bot.tscn")
const HAZARD_SCENE := preload("res://scenes/hazard.tscn")

const TOTAL_PARTICIPANTS := 50
const ARENA_LEFT := 72.0
const ARENA_RIGHT := 648.0
const ARENA_TOP := 220.0
const ARENA_BOTTOM := 1080.0
const BOT_LANE_COUNT := 7

var participants: Array[Node] = []
var player: Node = null
var match_active := true
var match_time := 0.0
var finish_position := 0
var elimination_count := 0
var player_eliminated := false
var result_overlay: Control = null

func _ready() -> void:
	_spawn_player()
	_spawn_bots(TOTAL_PARTICIPANTS - 1)
	_spawn_hazard()
	_refresh_participants()
	_update_status()

func _process(delta: float) -> void:
	if not match_active:
		return
	match_time += delta
	_refresh_participants()
	if participants.size() <= 1:
		_end_match()
	else:
		_update_status()

func _spawn_player() -> void:
	player = PLAYER_SCENE.instantiate()
	player.position = Vector2(360.0, 900.0)
	add_child(player)
	participants.append(player)

func _spawn_bots(count: int) -> void:
	for index in range(count):
		var bot := BOT_SCENE.instantiate()
		var lane := index % BOT_LANE_COUNT
		var lane_y := ARENA_TOP + 80.0 + float(lane) * 115.0
		var phase := fmod(float(index) * 0.37, 2.0)
		var spawn_x := ARENA_LEFT + fmod(float(index) * 113.0, ARENA_RIGHT - ARENA_LEFT)
		bot.position = Vector2(spawn_x, lane_y)
		bot.lane_y = lane_y
		bot.phase = phase
		bot.move_speed = 105.0 + float(index % 5) * 18.0
		bot.direction_hold_time = 2.6 + float(index % 4) * 0.45
		add_child(bot)
		participants.append(bot)

func _spawn_hazard() -> void:
	var hazard := HAZARD_SCENE.instantiate()
	hazard.position = Vector2(360.0, ARENA_TOP)
	add_child(hazard)

func _refresh_participants() -> void:
	var active_participants: Array[Node] = []
	for item in participants:
		if is_instance_valid(item) and item.is_inside_tree():
			active_participants.append(item)
	participants = active_participants

func _update_status() -> void:
	var status := get_node_or_null("Status")
	if status:
		status.text = "PARTICIPANTES %02d/%02d · %.1fs" % [participants.size(), TOTAL_PARTICIPANTS, match_time]

func register_elimination(body: Node) -> void:
	if not match_active:
		return
	elimination_count += 1
	if body == player:
		player_eliminated = true
		finish_position = clampi(TOTAL_PARTICIPANTS - elimination_count + 1, 1, TOTAL_PARTICIPANTS)
		_end_match()

func _end_match() -> void:
	if not match_active:
		return
	match_active = false
	if participants.size() == 1 and not player_eliminated:
		finish_position = 1
	elif finish_position <= 0:
		finish_position = clampi(TOTAL_PARTICIPANTS - elimination_count, 1, TOTAL_PARTICIPANTS)
	var status := get_node_or_null("Status")
	if status:
		if player_eliminated:
			status.text = "ELIMINADO · POSICIÓN %d · %.1fs" % [finish_position, match_time]
		else:
			status.text = "PARTIDA TERMINADA · POSICIÓN %d · %.1fs" % [finish_position, match_time]
	_show_result_screen()

func _show_result_screen() -> void:
	if is_instance_valid(result_overlay):
		return

	result_overlay = Control.new()
	result_overlay.name = "ResultOverlay"
	result_overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	result_overlay.mouse_filter = Control.MOUSE_FILTER_STOP
	add_child(result_overlay)

	var backdrop := ColorRect.new()
	backdrop.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	backdrop.color = Color(0.02, 0.025, 0.035, 0.94)
	backdrop.mouse_filter = Control.MOUSE_FILTER_IGNORE
	result_overlay.add_child(backdrop)

	var panel := PanelContainer.new()
	panel.position = Vector2(90.0, 360.0)
	panel.size = Vector2(540.0, 420.0)
	result_overlay.add_child(panel)

	var panel_style := StyleBoxFlat.new()
	panel_style.bg_color = Color(0.07, 0.08, 0.11, 1.0)
	panel_style.border_color = Color(0.22, 0.25, 0.32, 1.0)
	panel_style.set_border_width_all(2)
	panel_style.corner_radius_top_left = 24
	panel_style.corner_radius_top_right = 24
	panel_style.corner_radius_bottom_left = 24
	panel_style.corner_radius_bottom_right = 24
	panel.add_theme_stylebox_override("panel", panel_style)

	var content := VBoxContainer.new()
	content.add_theme_constant_override("separation", 22)
	content.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT, Control.PRESET_MODE_MINSIZE, 42)
	panel.add_child(content)

	var heading := Label.new()
	heading.text = "RESULTADO"
	heading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	heading.add_theme_font_size_override("font_size", 34)
	content.add_child(heading)

	var position_label := Label.new()
	position_label.text = "POSICIÓN %d" % finish_position
	position_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	position_label.add_theme_font_size_override("font_size", 48)
	content.add_child(position_label)

	var time_label := Label.new()
	time_label.text = "Tiempo de supervivencia  ·  %.1f s" % match_time
	time_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	time_label.add_theme_font_size_override("font_size", 20)
	content.add_child(time_label)

	var result_label := Label.new()
	result_label.text = "Has sido eliminado" if player_eliminated else "¡Eres el último en pie!"
	result_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	result_label.add_theme_font_size_override("font_size", 24)
	content.add_child(result_label)

	var replay := Button.new()
	replay.text = "JUGAR DE NUEVO"
	replay.custom_minimum_size = Vector2(0, 68)
	replay.add_theme_font_size_override("font_size", 22)
	replay.pressed.connect(_restart_match)
	content.add_child(replay)
	replay.grab_focus()

func _restart_match() -> void:
	get_tree().reload_current_scene()
