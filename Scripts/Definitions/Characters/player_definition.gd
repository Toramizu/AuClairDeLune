class_name PlayerDefinition extends CharacterDefinition

@export var max_hp : int = 100
@export var max_mp : int = 100
@export var max_ap : int = 100

@export var starting_gold : int = 5

func create() -> CharacterDefinition:
	var chara = super.create()
	
	chara.max_hp = max_hp
	chara.max_mp = max_mp
	chara.max_ap = max_ap
	
	return chara
