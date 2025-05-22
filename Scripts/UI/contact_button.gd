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
	var val = (npc.trust + 100) / i
	t_icon.texture = friendship_db.trust_icons[val]
	t_icon.tooltip_text = "Trust : %d (%s)" % [npc.trust, friendship_db.trust_names[val]]
	var a_icon = TextureRect.new()
	icon_list.add_child(a_icon)
	@warning_ignore("integer_division")
	val = (npc.attraction + 100) / i
	a_icon.texture = friendship_db.attraction_icons[val]
	a_icon.tooltip_text = "Attraction : %d (%s)" % [npc.attraction, friendship_db.attraction_names[val]]

func _on_button_pressed():
	SignalBus.show_contact_sheet.emit(contact)
