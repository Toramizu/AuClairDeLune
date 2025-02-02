extends MarginContainer

@export var hp_bar : TextureProgressBar
@export var hp_label : Label


func _ready():
	var player = %Player
	hp_bar.max_value = player.max_hp
	hp_bar.value = player.hp
	hp_label.text = "HP: %d/%d" % [player.hp, player.max_hp]
