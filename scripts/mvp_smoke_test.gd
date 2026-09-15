extends Node

const MAIN_SCENE := preload("res://scenes/main.tscn")
const EXPECTED_PARTICIPANTS := 50

func _ready() -> void:
	call_deferred("_run_smoke_test")

func _run_smoke_test() -> void:
	var scene := MAIN_SCENE.instantiate()
	get_tree().root.add_child(scene)
	await get_tree().process_frame

	var participants: Array = scene.participants
	if participants.size() != EXPECTED_PARTICIPANTS:
		push_error("MVP smoke test: expected %d participants, got %d" % [EXPECTED_PARTICIPANTS, participants.size()])
		get_tree().quit(1)
		return

	if not is_instance_valid(scene.player):
		push_error("MVP smoke test: player was not created")
		get_tree().quit(1)
		return

	if not is_instance_valid(scene.get_node_or_null("ArenaVisual")):
		push_error("MVP smoke test: arena visual was not created")
		get_tree().quit(1)
		return

	print("MVP smoke test passed: 50 participants, player and arena visual instantiated.")
	get_tree().quit(0)
