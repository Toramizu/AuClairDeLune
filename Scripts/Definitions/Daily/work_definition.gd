class_name WorkDefinition extends DailyGold

func do_work():
	SignalBus.start_dialogue.emit(dialogue, dialogue_start)
