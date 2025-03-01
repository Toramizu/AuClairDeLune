extends Node

const Balloon = preload("res://Scenes/Dialogue/balloon.tscn")

func _ready():
	SignalBus.start_dialogue.connect(start_dialogue)
	SignalBus.end_dialogue.connect(end_dialogue)

func start_dialogue(dialogue_resource: DialogueResource, dialogue_start: String):
	%LocationManager.toggle_details(false)
	%InfoPanel.toggle_details(false)
	
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)

func end_dialogue():
	%LocationManager.toggle_details(true)
	%InfoPanel.toggle_details(true)
	
