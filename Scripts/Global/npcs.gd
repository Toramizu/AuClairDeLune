extends Node

var base_characters : Dictionary = {}
var active_characters : Dictionary = {}

func _ready():
	var path = "res://Resources/Characters/"
	for filePath in DirAccess.get_files_at(path):
		var chara = load(path + filePath)
		if chara.id:
			base_characters[chara.id] = chara

func get_character(id: String):
	if active_characters.has(id):
		return active_characters[id]
	else:
		return null

func create_character(id: String, new_id: String, replace: bool = false):
	print(base_characters)
	if active_characters.has(new_id) and not replace:
		return active_characters[new_id]
	if base_characters.has(id):
		var chara = base_characters[id].create()
		active_characters[new_id] = chara
		return chara
	else:
		push_error("Character %s not found" % [id])
