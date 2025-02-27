extends Control

@export var button : Button

var contact : NPCDefinition

func initialize(npc: NPCDefinition):
	contact = npc
	button.text = "  - %s" % npc.shown_name


func _on_button_pressed():
	print(contact.last_name)
