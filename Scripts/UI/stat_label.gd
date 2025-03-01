extends DayNightNinePatchRect

@export var label : Label

var stat : StatDefinition

func initialize(_stat: StatDefinition, value:int):
	stat = _stat
	
	label.label_settings = label.label_settings.duplicate()
	label.label_settings.font_color = stat.color
	
	tooltip_text = stat.full_name
	set_value(value)

func set_value(value: int):
	label.text = "%s : %d" % [stat.id, value]
