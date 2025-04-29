class_name RndCharacterDefinition extends Resource

@export var id : String
@export var parent : RndCharacterDefinition
@export var name_generator : NameGenerator = NameGenerator.new()
@export var name_gender : int = 1

@export var max_hp : int
@export var max_mp : int
@export var max_ap : int

@export var stats : Array[StatsRnd]
@export var skills : Dictionary[String, int]

@export var tags : Array[String]
@export var flags : Dictionary[String, int]

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
	
	if name_generator:
		chara.first_name = name_generator.generate_first_name(name_gender) #first_name.pick_random()
		chara.last_name = name_generator.generate_last_name() #last_name.pick_random()
	
	chara.stats = {}
	
	chara.skills = {}
	for skill in Database.skills:
		if skill in skills:
			chara.skills[skill] = Tools.roll() + 20 * skills[skill]
		else:
			chara.skills[skill] = Tools.roll() + 20 * Database.skills[skill].default_level
	
