extends Node

var stats : Dictionary

func _ready():
	var path = "res://Resources/Stats/"
	for filePath in DirAccess.get_files_at(path):
		var stat = load(path + filePath)
		if stat.id:
			stats[stat.id] = stat
