extends Node

signal main_menu_requested

@export var starting_location : LocationDefinition

func init_game(load_data : bool):
	if load_data:
		load_game()
	else:
		new_game()

func new_game():
	%Debug.run_debug()
	%LocationManager.go_to_location(starting_location)
	%PlayerSheet.inti_player_sheet()
	%InfoPanel.init_info_panel()

func load_game():
	print("Continue?")
	new_game()

func _on_escape_requested() -> void:
	main_menu_requested.emit()

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("Esc"):
		_on_escape_requested()
