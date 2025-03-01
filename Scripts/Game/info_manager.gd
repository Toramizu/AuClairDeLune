extends Control

const contact_button = preload("res://Scenes/UI/contact_button.tscn")

@export var info_panel : Control

@export var contact_list : Control
@export var contact_button_container : Control
@export var npc_sheet : NpcSheet

@export var task_container : Control

@export var settings_container : Control

func init_info_panel():
	SignalBus.show_contact_sheet.connect(show_contact)
	init_contact_list()
	show_tab(0)

func show_tab(tab : int):
	close_tabs()
	if tab == 0:
		show_contacts()
	elif tab == 1:
		show_tasks()
	else:
		show_settings()

func toggle_details(toggle: bool):
	info_panel.visible = toggle

func close_tabs():
	contact_list.visible = false
	npc_sheet.visible = false
	task_container.visible = false
	settings_container.visible = false

func init_contact_list():
	contact_list.visible = true
	for child in contact_button_container.get_children():
		child.queue_free()
	for contact in Npcs.contacts:
		var button = contact_button.instantiate()
		contact_button_container.add_child(button)
		button.initialize(contact)

func show_contacts():
	contact_list.visible = true

func show_contact(contact : NPCDefinition):
	npc_sheet.visible = true
	contact_list.visible = false
	npc_sheet.show_npc_stats(contact)

func show_tasks():
	task_container.visible = true

func show_settings():
	settings_container.visible = true
