extends Node

@export var generator : NameGenerator
@export var npcs : Array[NPCDefinition]

func run_debug():
	print("Ding")
	Npcs.contacts = npcs

func ding():
	#print("Ding")
	print(generator.generate_first_name(1) + " " + generator.generate_last_name())
