extends Node

var sorted_stats : Array[String]

var stats : Dictionary[String, StatDefinition]
var skills : Dictionary[String, SkillDefinition]
var i : int

func _ready():
	var path = "res://Resources/Stats/"
	for filePath in DirAccess.get_files_at(path):
		var stat = load(path + filePath)
		if stat.id:
			stats[stat.id] = stat
			sorted_stats.append(stat.id)
	sorted_stats.sort_custom(sort_ascending)
	
	path = "res://Resources/Skills/"
	for filePath in DirAccess.get_files_at(path):
		var skill = load(path + filePath)
		if skill.id:
			skills[skill.id] = skill
			skill._load_db(stats)

func sort_ascending(a, b):
	if stats[a].order < stats[b].order:
		return true
	return false
