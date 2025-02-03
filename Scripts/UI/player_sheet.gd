extends NinePatchRect

@export var name_label : Label
@export var stats_container : Container
@export var gold_label : Label

var stat_preload = preload("res://Scenes/UI/stat_label.tscn")

func _ready():
	var player = %Player
	var statsDB = Database.stats
	name_label.text = "%s %s" % [player.first_name, player.last_name]
	for stat_key in player.stats:
		var stat := stat_preload.instantiate()
		stat.initialize(statsDB[stat_key], player.stats[stat_key])
		stats_container.add_child(stat)
	gold_label.text = "%d" % [player.gold]
