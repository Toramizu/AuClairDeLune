extends DayNightNinePatchRect

@export var button : Button

var contact : NPCDefinition

func initialize(npc: NPCDefinition):
	contact = npc
	button.text = "  - %s" % npc.shown_name

func _on_button_pressed():
	SignalBus.show_contact_sheet.emit(contact)
