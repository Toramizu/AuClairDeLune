extends Control

@export var label : Label

func initialize(skill: SkillDefinition, value:int = 0):
	label.text = "%s : %d" % [skill.id, value]
	
	label.label_settings = label.label_settings.duplicate()
	label.label_settings.font_color = skill.color
	
	tooltip_text = skill.full_name
