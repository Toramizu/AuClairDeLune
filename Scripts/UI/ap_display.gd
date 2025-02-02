extends MarginContainer

@export var ap_bar : TextureProgressBar
@export var ap_label : Label


func _ready():
	var player = %Player
	ap_bar.max_value = player.max_ap
	ap_bar.value = player.ap
	ap_label.text = "HP: %d/%d" % [player.ap, player.max_ap]
