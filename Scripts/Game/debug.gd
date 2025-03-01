extends Node

@export var generator : NameGenerator
@export var npcs : Array[NPCDefinition]

func run_debug():
	Npcs.contacts = npcs

func ding():
	print(generator.generate_first_name(1) + " " + generator.generate_last_name())
