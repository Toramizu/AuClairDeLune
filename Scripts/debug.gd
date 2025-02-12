extends Node

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func debugDialogue():
	%InteractionManager.start_dialogue(dialogue_resource, dialogue_start)
	
func endDebugDialogue():
	print("Debug Dialogue Complete!")
