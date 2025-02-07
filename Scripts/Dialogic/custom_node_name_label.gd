extends DialogicNode_NameLabel

@export var text_size := 0

func _ready():
	var real_text_size = Settings.text_size + text_size
	add_theme_font_size_override(&"normal_font_size", text_size)
	add_theme_font_size_override(&"bold_font_size", text_size)
	add_theme_font_size_override(&"italics_font_size", text_size)
	add_theme_font_size_override(&"bold_italics_font_size", text_size)
