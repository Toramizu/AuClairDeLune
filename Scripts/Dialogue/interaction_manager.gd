extends Node

const Balloon = preload("res://Scenes/Dialogue/balloon.tscn")

func start_dialogue(dialogue_resource: DialogueResource, dialogue_start: String):
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_start)
