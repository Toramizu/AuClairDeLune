extends Control

@export var ap_bar : TextureProgressBar
@export var ap_label : Label


func _ready():
	show_resource()
	SignalBus.stats_changed.connect(show_resource)

func show_resource():
	ap_bar.max_value = Player.max_ap
	ap_bar.value = Player.ap
	ap_label.text = "💜 %d/%d" % [Player.ap, Player.max_ap]
