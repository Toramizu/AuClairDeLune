extends Node

var a1: CharacterDefinition
var a2: CharacterDefinition
var a3: CharacterDefinition
var a4: CharacterDefinition
var actors : Dictionary[String, CharacterDefinition]

func by_actor(actor_id, chara: CharacterDefinition):
	if actor_id == "a1":
		a1 = chara
	elif actor_id == "a2":
		a2 = chara
	elif actor_id == "a3":
		a3 = chara
	elif actor_id == "a4":
		a4 = chara
	
	actors[actor_id] = chara

func by_id(actor_id, chara_id: String):
	actors[actor_id] = Npcs.get_character(chara_id)

func by_tags(actor_id, tags: Array[String]):
	var lst = []
	for actor in actors:
		if tags in actors[actor].tag:
			lst.append(actors[actor])
	actors[actor_id] = lst.pick_random()
