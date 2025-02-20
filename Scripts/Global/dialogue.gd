extends Node

var actors : Dictionary

func by_id(actor_id: String, chara_id: String):
	actors[actor_id] = Npcs.get_character_by_id(chara_id)

func by_tags(actor_id: String, tags: Array[String]):
	var lst = []
	for actor in actors:
		if tags in actors[actor].tag:
			lst.append(actors[actor])
	actors[actor_id] = lst.pick_random()
