extends Control

@export var name_label : RichTextLabel
@export var gold_container : Control
@export var gold_label : RichTextLabel
@export var sleep_label : RichTextLabel
@export var stats_container : Container

@export var skill_container : Container

@export var inventory_container : Container

var stat_preload = preload("res://Scenes/UI/stat_label.tscn")
var skill_preload = preload("res://Scenes/UI/skill_label.tscn")

#Temp
@export var food_expense : DailyGold

func inti_player_sheet():
	show_tab(0)
	name_label.text = "[center]%s[/center]" % Player.shown_name
	
	var statsDB = Database.stats
	for stat_key in Database.sorted_stats:
		var stat := stat_preload.instantiate()
		stat.initialize(statsDB[stat_key], Player.get_stat(stat_key))
		stats_container.add_child(stat)
	
	var skillDB = Database.skills
	for skill_key in Player.skills:
		var skill := skill_preload.instantiate()
		skill.initialize(skillDB[skill_key], Player.get_skill(skill_key))
		skill_container.add_child(skill)
	
	Player.dailies.append(food_expense)
	Player.dailies.append(food_expense)
	Player.dailies.append(food_expense)
	
	display_gold()
	SignalBus.gold_change.connect(display_gold)

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

func display_gold():
	var earnings = 0
	var tooltip = ""
	for daily in Player.dailies:
		earnings += daily.amount
		if daily.amount < 0:
			tooltip += "%s : [color=#bf1029]%d[/color]\n" % [daily.summary, daily.amount]
		else:
			tooltip += "%s : [color=#3f8f29]%d[/color]\n" % [daily.summary, daily.amount]
	if earnings < 0:
		gold_label.text = "%d [color=#bf1029](%d)[/color]" % [Player.gold, earnings]
	else:
		gold_label.text = "%d [color=#3f8f29](%d)[/color]" % [Player.gold, earnings]
	gold_container.tooltip_text = tooltip

func display_sleep():
	if Player.sleep_location:
		sleep_label.text = Player.sleep_location.loc_name
		sleep_label.tooltip_text = Player.sleep_location.details
	else:
		#TODO : Look for label in location
		sleep_label.text = "None"
		sleep_label.tooltip_text = ""
