extends Control

@export var mp_bar : TextureProgressBar
@export var mp_label : Label


func _ready():
	mp_bar.max_value = Player.max_mp
	mp_bar.value = Player.mp
	mp_label.text = "%d/%d" % [Player.mp, Player.max_mp]
