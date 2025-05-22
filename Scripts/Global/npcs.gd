extends Node

var base_characters : Dictionary[String, RndCharacterDefinition]
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

#Get character
func get_character(id: String):
	if active_characters.has(id):
		return active_characters[id]
	elif base_characters.has(id):
		return base_characters[id]
	else:
		return null

func get_character_by_tags(tags: Array[String] = [], create_chance: float = 0, create_if_none: bool = true):
	if create_chance > randf():
		return get_base_character(tags)
	else:
		var chara = get_active_character(tags)
		if not chara and create_if_none:
			return get_base_character(tags)
		else:
			return chara

func get_active_character(tags: Array[String] = []):
	if tags:
		var lst = active_characters_tags[tags.pop_back()]
		while tags:
			tags_search = tags.pop_back()
			lst.filter()
		if lst:
			return lst.pick_random()
		else:
			return null
	else:
		return active_characters.values().pick_random()

func get_base_character(tags: Array[String] = []):
	if tags:
		var lst = base_characters_tags[tags.pop_back()]
		while tags:
			tags_search = tags.pop_back()
			lst.filter()
		if lst:
			return lst.pick_random()
		else:
			return null
	else:
		return base_characters.values().pick_random()

func tag_filter(chara) -> bool:
	return chara.tags.has(tags_search)


func create_character(base_id: String, new_id: String = "", override: bool = false):
	if base_characters.has(base_id):
		var chara = base_characters[base_id].create()
		active_characters[new_id] = chara
		if new_id:
			save_character(chara, new_id, override)
		return chara
	else:
		push_error("Character not found :  %s" % [base_id])

func save_character(chara: CharacterDefinition, id: String, override: bool = false):
	if not active_characters.has(id) or override:
		active_characters[id] = chara
