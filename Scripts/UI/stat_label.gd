extends Control

@export var label : Label

func initialize(stat: StatDefinition, value:int = 0):
	label.text = "%s : %d" % [stat.id, value]
	
	label.label_settings = label.label_settings.duplicate()
	label.label_settings.font_color = stat.color
	
	tooltip_text = stat.full_name
