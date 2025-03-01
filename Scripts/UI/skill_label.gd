extends DayNightNinePatchRect

const tooltip_scene: PackedScene = preload("res://Scenes/UI/skill_tooltip.tscn")

@export var label : Label

var skill : SkillDefinition

func initialize(_skill: SkillDefinition, value:int):
	skill = _skill
	label.label_settings = label.label_settings.duplicate()
	label.label_settings.font_color = skill.color
	
	tooltip_text = skill.id
	
	set_value(value)

func set_value(value: int):
	label.text = "%s : %d" % [skill.id, value]

func _make_custom_tooltip(_for_text) -> Control:
	var tooltip = tooltip_scene.instantiate()
	#var skill = Database.skills[for_text]
	tooltip.set_text(skill)
	return tooltip
