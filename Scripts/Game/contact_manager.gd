extends VBoxContainer

const npc_label = preload("res://Scenes/UI/npc_label.tscn")

func show_contacts():
	print("Dong")
	for npc in Npcs.contacts:
		var label = npc_label.instantiate()
		add_child(label)
		label.initialize(npc)
