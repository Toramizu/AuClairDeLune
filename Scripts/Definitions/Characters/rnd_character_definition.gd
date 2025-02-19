class_name RndCharacterDefinition extends Resource

@export var id : String
@export var parent : RndCharacterDefinition
@export var first_name : Array[String]
@export var last_name : Array[String]

@export var stats : Array[StatsRnd]
@export var skills : Dictionary

@export var tags : Array[String]
@export var flags : Dictionary

func create(new_id: String):
	var chara
	if parent:
		chara = parent.create(new_id)
		chara.tags += tags
		chara.flags += flags
	else:
		chara = CharacterDefinition.new()
		chara.id = new_id
		chara.tags = tags.duplicate()
		chara.flags = flags.duplicate()
	
	chara.first_name = Tools.pick(first_name)
	chara.last_name = Tools.pick(last_name)
	
	chara.stats = {}
	
	chara.skills = {}
	for skill in Database.skills:
		if skill in skills:
			chara.skills[skill] = Tools.roll() + 20 * skills[skill]
		else:
			chara.skills[skill] = Tools.roll() + 20 * Database.skills[skill].default_level
	
