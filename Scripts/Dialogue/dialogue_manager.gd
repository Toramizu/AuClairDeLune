extends Control

func _ready():
	Dialogic.signal_event.connect(dialogue_signal_manager)

func start_dialogue(dialogue: String):
	Dialogic.start(dialogue)

func dialogue_signal_manager(arg):
	print(arg)
