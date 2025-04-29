class_name SkillDefinition extends Resource

enum SkillLevel {NOVICE, AMATEUR, SKILLED, EXPERT, MASTER, LEGENDARY} 

@export var id : String
@export var full_name : String
@export var icon : Texture
@export var start_value : int

@export var _main_stat : String
@export var _sub_stat : String

var main_stat : StatDefinition
var sub_stat : StatDefinition

var color : Color :
	get :
		if main_stat:
			return main_stat.color
		else:
			return Color.WEB_GRAY

func _load_db(stats : Dictionary[String, StatDefinition]):
	if _main_stat:
		main_stat = stats[_main_stat]
	if _sub_stat:
		sub_stat = stats[_sub_stat]
