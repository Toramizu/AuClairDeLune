extends MarginContainer

@export var hp_bar : TextureProgressBar
@export var hp_label : Label


func _ready():
	hp_bar.max_value = Player.max_hp
	hp_bar.value = Player.hp
	hp_label.text = "HP: %d/%d" % [Player.hp, Player.max_hp]
