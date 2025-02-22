class_name SkillDefinition extends Resource

enum SkillLevel {NOVICE, AMATEUR, SKILLED, EXPERT, MASTER, LEGENDARY} 

@export var id : String
@export var full_name : String
@export var type_id : String
@export var icon : Texture
@export var start_value : int

var type : SkillTypeDefinition
var color : Color :
	get :
		if type:
			return type.color
		else:
			return Color.WEB_GRAY

func _load_db(skill_types : Dictionary):
	if type_id:
		type = skill_types[type_id]
