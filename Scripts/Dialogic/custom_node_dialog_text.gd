extends DialogicNode_DialogText

@export var text_size := 0
@export var text_color : Color

var real_text_size : int

func _ready():
	var real_text_size = Settings.text_size + text_size
	add_theme_font_size_override(&"normal_font_size", text_size)
	add_theme_font_size_override(&"bold_font_size", text_size)
	add_theme_font_size_override(&"italics_font_size", text_size)
	add_theme_font_size_override(&"bold_italics_font_size", text_size)

func reveal_text(_text: String, keep_previous:=false) -> void:
	if !enabled:
		return
	show()

	if !keep_previous:
		text = '[font_size={42}]' + _text
		#text = '[font_size=' + str(text_size) + '][color=#' + text_color.to_html(false) + ']' + _text
		base_visible_characters = 0

		if alignment == Alignment.CENTER:
			text = '[center]'+text
		elif alignment == Alignment.RIGHT:
			text = '[right]'+text
		visible_characters = 0

	else:
		base_visible_characters = len(text)
		visible_characters = len(get_parsed_text())
		text = text + _text

		# If Auto-Skip is enabled and we append the text (keep_previous),
		# we can skip revealing the text and just show it all at once.
		if DialogicUtil.autoload().Inputs.auto_skip.enabled:
			visible_characters = 1
			return

	revealing = true
	speed_counter = 0
	started_revealing_text.emit()
