extends Control

#@export var text : RichTextLabel

func set_text(skill : SkillDefinition):
	var tooltip = "[font_size=18][b]%s[/b] (%d)[/font_size]\nLearned : %d" % [skill.full_name, Player.get_skill(skill.id), Player.skills[skill.id]]
	if skill.main_stat:
		tooltip += "\nMain (%s) : %d" % [skill._main_stat, Player.get_stat_mod(skill.main_stat.id)]
	if skill.sub_stat:
		tooltip += "\nSub (%s/2) : %d" % [skill._sub_stat, Player.get_stat_mod(skill.sub_stat.id, true)]
	
	self.text = tooltip
