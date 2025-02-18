class_name LocationButton extends Node

var sublocation : SubLocationDefinition

func set_sublocation(sub : SubLocationDefinition):
	sublocation = sub
	self.position = sub.icon_position
	self.icon = sub.icon
	if sub.icon_size:
		self.size = sub.icon_size
	self.tooltip_text = sub.full_name

func _on_pressed():
	SignalBus.start_dialogue.emit(sublocation.default_event, sublocation.default_start)
