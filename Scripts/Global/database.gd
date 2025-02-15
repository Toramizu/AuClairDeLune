extends Node

var skills : Dictionary
var stats : Dictionary
var i : int

func _ready():
	var path = "res://Resources/Stats/"
	for filePath in DirAccess.get_files_at(path):
		var stat = load(path + filePath)
		if stat.id:
			stats[stat.id] = stat
			
	path = "res://Resources/Skills/"
	for filePath in DirAccess.get_files_at(path):
		var skill = load(path + filePath)
		if skill.id:
			skills[skill.id] = skill
