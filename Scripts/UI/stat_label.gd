extends Control

@export var label : Label

func initialize(stat: StatDefinition):
	label.text = "%s : %d" % [stat.id, 0]
	
	label.label_settings = label.label_settings.duplicate()
	label.label_settings.font_color = stat.color
	
	tooltip_text = stat.fullname
