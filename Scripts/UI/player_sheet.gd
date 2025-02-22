extends Control

@export var name_label : Label
@export var gold_label : Label
@export var stats_container : Container
@export var skill_container : Container

var stat_preload = preload("res://Scenes/UI/stat_label.tscn")
var skill_preload = preload("res://Scenes/UI/skill_label.tscn")

func _ready():
	name_label.text = Player.shown_name
	
	var statsDB = Database.stats
	for stat_key in Player.stats:
		var stat := stat_preload.instantiate()
		stat.initialize(statsDB[stat_key], Player.stats[stat_key])
		stats_container.add_child(stat)
		
	gold_label.text = "%d" % [Player.gold]
	
	var skillDB = Database.skills
	for skill_key in Player.skills:
		var skill := skill_preload.instantiate()
		skill.initialize(skillDB[skill_key], Player.skills[skill_key])
		skill_container.add_child(skill)
