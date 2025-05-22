class_name NpcSheet extends Control

@export var name_label : RichTextLabel
@export var image_texture : TextureRect

@export var phone_event : DialogueResource

var npc : NPCDefinition

func show_npc_stats(contact : NPCDefinition):
	npc = contact
	name_label.text = "[center]%s[/center]" % npc.shown_name
	image_texture.texture = contact.image

func phone_npc():
	Dialogue.by_actor("a1", npc)
	SignalBus.start_dialogue.emit(phone_event, "start")
