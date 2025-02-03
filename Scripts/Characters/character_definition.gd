class_name CharacterDefinition extends Resource

@export var id : String
@export var first_name : String
@export var last_name : String
@export var stats : Dictionary
@export var skills : Dictionary

@export var max_hp : int = 100
@export var max_mp : int = 100
@export var max_ap : int = 100

func create() -> CharacterDefinition:
	var chara = CharacterDefinition.new()
	
	chara.id = id
	chara.first_name = first_name
	chara.last_name = last_name
	chara.stats = stats.duplicate()
	chara.skills = skills.duplicate()
	chara.max_hp = max_hp
	chara.max_mp = max_mp
	chara.max_ap = max_ap
	
	return chara
