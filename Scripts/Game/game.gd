extends Node

signal main_menu_requested

func init_game(load_data : bool):
	if load_data:
		load_game()
	else:
		new_game()

func new_game():
	print("New Game!")

func load_game():
	print("Continue!")

func _on_escape_requested() -> void:
	main_menu_requested.emit()

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("Esc"):
		_on_escape_requested()
