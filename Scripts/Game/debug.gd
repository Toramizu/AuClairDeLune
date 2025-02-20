extends Node

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

@export var generator : NameGenerator

func debugDialogue():
	%InteractionManager.start_dialogue(dialogue_resource, dialogue_start)
	
func ding():
	#print("Ding")
	print(generator.generate_first_name(1) + " " + generator.generate_last_name())
