class_name NpcSheet extends Control

@export var name_label : RichTextLabel
@export var image_texture : TextureRect

var npc : NPCDefinition

func show_npc_stats(contact : NPCDefinition):
	npc = contact
	name_label.text = npc.shown_name
	image_texture.texture = contact.image
