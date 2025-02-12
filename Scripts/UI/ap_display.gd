extends MarginContainer

@export var ap_bar : TextureProgressBar
@export var ap_label : Label


func _ready():
	ap_bar.max_value = Player.max_ap
	ap_bar.value = Player.ap
	ap_label.text = "HP: %d/%d" % [Player.ap, Player.max_ap]
