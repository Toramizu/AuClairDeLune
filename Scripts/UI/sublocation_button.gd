class_name LocationButton extends Node

@export var label : RichTextLabel

var sublocation : SubLocationDefinition

func set_sublocation(sub : SubLocationDefinition):
	sublocation = sub
	self.position = sub.icon_position
	self.icon = sub.icon
	if sub.icon_size:
		self.size = sub.icon_size
	self.tooltip_text = sub.full_name
	if sublocation.cost:
		label.text = "%d %c" % [sublocation.cost, Player.resource_icons[sublocation.resource]]
	else:
		label.text = ""

func _on_pressed():
	SignalBus.start_dialogue.emit(sublocation.default_event, sublocation.default_start)
