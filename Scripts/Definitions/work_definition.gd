class_name WorkDefinition extends Resource

@export var work_id: String
@export var dialogue: DialogueResource
@export var dialogue_start: String = "start"

func do_work():
	SignalBus.start_dialogue.emit(dialogue, dialogue_start)
