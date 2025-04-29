extends Node

var base_characters : Dictionary[String, CharacterDefinition]
var base_characters_tags : Dictionary

var active_characters : Dictionary[String, CharacterDefinition]
var active_characters_tags : Dictionary

var tags_search: String

var contact_ids : Array[String]
var contacts : Array[NPCDefinition]

func _ready():
	var path = "res://Resources/RndCharacters/"
	for filePath in DirAccess.get_files_at(path):
		var chara = load(path + filePath)
		if chara.id:
			base_characters[chara.id] = chara
			for tag in chara.tags:
				if not base_characters_tags.has(tag):
					base_characters_tags[tag] = []
				base_characters_tags[tag].append(chara)
	
	path = "res://Resources/Characters/"
	for filePath in DirAccess.get_files_at(path):
		var chara = load(path + filePath)
		if chara.id:
			active_characters[chara.id] = chara
			for tag in chara.tags:
				if not active_characters_tags.has(tag):
					active_characters_tags[tag] = []
				active_characters_tags[tag].append(chara)
			chara._complete_load()
	
	for id in contact_ids:
		contacts.append(active_characters[id])

func get_character_by_id(id: String):
	if active_characters.has(id):
		return active_characters[id]
	else:
		return null

func get_character_by_tags(tags: Array[String]):
	var lst = active_characters_tags[tags.pop_back()]
	while tags:
		tags_search = tags.pop_back()
		lst.filter()
	if lst:
		return lst.pick_random()
	else:
		return null

func tag_filter(chara) -> bool:
	return chara.tags.has(tags_search)

func create_character(id: String, new_id: String, replace: bool = false):
	if active_characters.has(new_id) and not replace:
		return active_characters[new_id]
	if base_characters.has(id):
		var chara = base_characters[id].create()
		active_characters[new_id] = chara
		return chara
	else:
		push_error("Character not found :  %s" % [id])
