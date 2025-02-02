extends MarginContainer

@export var mp_bar : TextureProgressBar
@export var mp_label : Label


func _ready():
	var player = %Player
	mp_bar.max_value = player.max_mp
	mp_bar.value = player.mp
	mp_label.text = "HP: %d/%d" % [player.mp, player.max_mp]
