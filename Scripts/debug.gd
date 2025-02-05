extends Node

func debugDialogue():
	print("Debug Dialogue!")
	%DialogueManager.start_dialogue("margaretIntro")
	
func endDebugDialogue():
	print("Debug Dialogue Complete!")
