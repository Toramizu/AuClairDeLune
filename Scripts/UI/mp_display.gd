extends Control

@export var mp_bar : TextureProgressBar
@export var mp_label : Label


func _ready():
	show_resource()
	SignalBus.stats_changed.connect(show_resource)

func show_resource():
	mp_bar.max_value = Player.max_mp
	mp_bar.value = Player.mp
	mp_label.text = "🔷 %d/%d" % [Player.mp, Player.max_mp]
