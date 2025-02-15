extends Control

@export var name_label : Label
@export var stats_container : Container
@export var gold_label : Label

var stat_preload = preload("res://Scenes/UI/stat_label.tscn")

func _ready():
	var statsDB = Database.stats
	name_label.text = "%s %s" % [Player.first_name, Player.last_name]
	for stat_key in Player.stats:
		var stat := stat_preload.instantiate()
		stat.initialize(statsDB[stat_key], Player.stats[stat_key])
		stats_container.add_child(stat)
	gold_label.text = "%d" % [Player.gold]
