extends Node

var stats : Dictionary
var skill_types : Dictionary
var skills : Dictionary
var i : int

func _ready():
	var path = "res://Resources/Stats/"
	for filePath in DirAccess.get_files_at(path):
		var stat = load(path + filePath)
		if stat.id:
			stats[stat.id] = stat
	
	path = "res://Resources/Skills/SkillTypes/"
	for filePath in DirAccess.get_files_at(path):
		var skill_type = load(path + filePath)
		if skill_type.id:
			skill_types[skill_type.id] = skill_type
			skill_type._load_db(stats)
	
	path = "res://Resources/Skills/"
	for filePath in DirAccess.get_files_at(path):
		var skill = load(path + filePath)
		if skill.id:
			skills[skill.id] = skill
			skill._load_db(skill_types)
