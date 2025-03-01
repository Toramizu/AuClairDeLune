extends Control

@export var name_label : RichTextLabel
@export var gold_label : Label
@export var stats_container : Container

@export var skill_container : Container

@export var inventory_container : Container

var stat_preload = preload("res://Scenes/UI/stat_label.tscn")
var skill_preload = preload("res://Scenes/UI/skill_label.tscn")

func inti_player_sheet():
	show_tab(0)
	name_label.text = "[center]%s[/center]" % Player.shown_name
	
	var statsDB = Database.stats
	for stat_key in Database.sorted_stats:
		var stat := stat_preload.instantiate()
		stat.initialize(statsDB[stat_key], Player.get_stat(stat_key))
		stats_container.add_child(stat)
		
	gold_label.text = "%d" % [Player.gold]
	
	var skillDB = Database.skills
	for skill_key in Player.skills:
		var skill := skill_preload.instantiate()
		skill.initialize(skillDB[skill_key], Player.get_skill(skill_key))
		skill_container.add_child(skill)

func show_tab(tab : int):
	close_tabs()
	if tab == 0:
		show_skills()
	else:
		show_inventory()

func close_tabs():
	skill_container.visible = false
	inventory_container.visible = false

func show_skills():
	skill_container.visible = true

func show_inventory():
	inventory_container.visible = true
