extends Control

const tooltip_scene: PackedScene = preload("res://Scenes/UI/skill_tooltip.tscn")

@export var label : Label

func initialize(skill: SkillDefinition, value:int = 0):
	label.text = "%s : %d" % [skill.id, value]
	
	label.label_settings = label.label_settings.duplicate()
	label.label_settings.font_color = skill.color
	
	tooltip_text = skill.id

func _make_custom_tooltip(for_text) -> Control:
	var tooltip = tooltip_scene.instantiate()
	var skill = Database.skills[for_text]
	tooltip.set_text(skill)
	return tooltip
