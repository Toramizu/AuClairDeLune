extends BetterTooltip

@export var label : Label

var skill : SkillDefinition

func initialize(_skill: SkillDefinition, value:int):
	skill = _skill
	label.label_settings = label.label_settings.duplicate()
	label.label_settings.font_color = skill.color
	
	tooltip_text = skill.id
	
	set_value(value)
	set_tooltip()

func set_value(value: int):
	label.text = "%s : %d" % [skill.id, value]

func set_tooltip():
	var tooltip = "[font_size=18][b]%s[/b] (%d)[/font_size]\nLearned : %d" % [skill.full_name, Player.get_skill(skill.id), Player.skills[skill.id]]
	if skill.main_stat:
		tooltip += "\nMain (%s) : %d" % [skill._main_stat, Player.get_stat_mod(skill.main_stat.id)]
	if skill.sub_stat:
		tooltip += "\nSub (%s/2) : %d" % [skill._sub_stat, Player.get_stat_mod(skill.sub_stat.id, true)]
	
	tooltip_text = tooltip
