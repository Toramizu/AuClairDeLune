extends BetterTooltip

@export var label : Label

var stat : StatDefinition

func initialize(_stat: StatDefinition, value:int):
	stat = _stat
	
	label.label_settings = label.label_settings.duplicate()
	label.label_settings.font_color = stat.color
	
	tooltip_text = stat.full_name
	set_value(value)
	set_tooltip()

func set_value(value: int):
	label.text = "%s : %d" % [stat.id, value]

func set_tooltip():
	var tooltip = "[font_size=18][b]%s[/b] (%d)[/font_size]\nNatural : %d" % [stat.full_name, Player.get_stat(stat.id), Player.stats[stat.id]]
	#if skill.main_stat:
	#	tooltip += "\nMain (%s) : %d" % [skill._main_stat, Player.get_stat_mod(skill.main_stat.id)]
	#if skill.sub_stat:
	#	tooltip += "\nSub (%s/2) : %d" % [skill._sub_stat, Player.get_stat_mod(skill.sub_stat.id, true)]
	
	tooltip_text = tooltip
