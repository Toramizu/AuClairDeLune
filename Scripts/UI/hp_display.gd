extends Control

@export var hp_bar : TextureProgressBar
@export var hp_label : Label


func _ready():
	show_resource()
	SignalBus.stats_changed.connect(show_resource)

func show_resource():
	hp_bar.max_value = Player.max_hp
	hp_bar.value = Player.hp
	hp_label.text = "🟡 %d/%d" % [Player.hp, Player.max_hp]
