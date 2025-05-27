extends Control

@export var chara_name : RichTextLabel
@export var icon_list : Control

@export var friendship_db : FriendshipDB

var contact : NPCDefinition

func initialize(npc: NPCDefinition):
	contact = npc
	chara_name.text = "%s" % npc.shown_name
	@warning_ignore("integer_division")
	var i = 200 / friendship_db.ranks
	var t_icon = TextureRect.new()
	icon_list.add_child(t_icon)
	@warning_ignore("integer_division")
	var val = (npc.love + 100) / i
	t_icon.texture = friendship_db.love_icons[val]
	t_icon.tooltip_text = "Love : %d" % [npc.love]
	var a_icon = TextureRect.new()
	icon_list.add_child(a_icon)
	@warning_ignore("integer_division")
	val = (npc.lust + 100) / i
	a_icon.texture = friendship_db.lust_icons[val]
	a_icon.tooltip_text = "Lust : %d" % [npc.lust]

func _on_button_pressed():
	SignalBus.show_contact_sheet.emit(contact)
