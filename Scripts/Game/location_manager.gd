extends TextureRect

@export var location_name : RichTextLabel
@export var location_panel : Control

var location_preload = preload("res://Scenes/UI/location_button.tscn")

var current_location : LocationDefinition

func go_to_location(location : LocationDefinition):
	current_location = location
	show_current_location()

func show_current_location():
	location_name.text = "[center]%s[/center]" % current_location.full_name
	texture = current_location.background
	
	for sublocation in current_location.sublocations:
		if not sublocation.condition or Tools.check_condition_string(sublocation.condition):
			add_sublocation(sublocation)

func toggle_details(toggle: bool):
	location_panel.visible = toggle

func add_sublocation(sublocation: SubLocationDefinition):
	var button = location_preload.instantiate()
	location_panel.add_child(button)
	button.set_sublocation(sublocation)
