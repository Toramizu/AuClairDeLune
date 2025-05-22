extends Button

@export var base_cost : int = 2
@export var label : RichTextLabel

func _on_pressed():
	Player.mp -= base_cost
