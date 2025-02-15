class_name CharacterDefinition extends Resource

@export var id : String
@export var first_name : String
@export var last_name : String

@export var stats : Dictionary
@export var skills : Dictionary

@export var tags : Array[String]

func create() -> CharacterDefinition:
	var chara = CharacterDefinition.new()
	
	chara.id = id
	chara.first_name = first_name
	chara.last_name = last_name
	chara.stats = stats.duplicate()
	chara.skills = skills.duplicate()
	
	return chara
