extends Node

const player_def: PlayerDefinition = preload("res://Resources/Players/test_player.tres")
#const player_def: PlayerDefinition = preload("res://Resources/Players/player.tres")

enum Resource_Types {HEALTH, MENTAL, ARO}
const resource_icons = ["🟡", "🔷", "💜"]
var health : int
var mental : int
var aro : int
var hp :
	get :
		return health
	set(value) :
		health = value
		if health > max_hp:
			health = max_hp
		SignalBus.stats_changed.emit()
var mp :
	get :
		return mental
	set(value) :
		mental = value
		if mental > max_mp:
			mental = max_mp
		SignalBus.stats_changed.emit()
var ap :
	get :
		return aro
	set(value) :
		aro = value
		if aro > max_ap:
			aro = max_ap
		SignalBus.stats_changed.emit()

var gold : int
var dailies : Array[DailyGold]
var total_dailies:
	get:
		var val = 0
		for daily in dailies:
			val += daily.amount
		return val

var sleep_location : SleepLocationDefinition

var character : PlayerDefinition

var first_name : String :
	get:
		return character.first_name
var last_name : String :
	get:
		return character.last_name
var shown_name : String :
	get:
		return character.shown_name

var stats : Dictionary[String, int] :
	get:
		return character.stats
var skills : Dictionary[String, int] :
	get:
		return character.skills

var max_hp : int :
	get:
		return character.max_hp
var max_mp : int :
	get:
		return character.max_mp
var max_ap : int :
	get:
		return character.max_ap

var day_work : WorkDefinition
var night_work : WorkDefinition

func _ready():
	character = player_def.duplicate()
	character._complete_load()
	hp = character.max_hp
	mp = character.max_mp
	ap = character.max_ap
	gold = character.starting_gold

#Resources
func regen_resources() -> void:
	hp += get_stat("Con")
	mp += get_stat("Wil")
	ap += get_stat("Lib")

#Stats & Skills
func get_stat(stat: String) -> int:
	return character.get_stat(stat)

func get_stat_mod(stat: String, sub: bool = false) -> int:
	return character.get_stat_mod(stat, sub)

func get_skill(skill: String) -> int:
	return character.get_skill(skill)

func improve_skill(skill: String, amount: int = 1) -> void:
	character.skills[skill] += amount
	

#Money
func earn_gold(amount: int):
	gold += amount
	SignalBus.gold_change.emit()

func check_gold(amount: int):
	return gold >= amount

func add_daily(daily: DailyGold):
	dailies.append(daily)

func remove_daily(id: String):
	for daily in dailies:
		if daily.id == id:
			dailies.erase(daily)

func get_dailies():
	for daily in dailies:
		if daily.dialogue:
			SignalBus.start_dialogue.emit(daily.dialogue, daily.dialogue_start)
			await DialogueManager.dialogue_ended
		else:
			Player.earn_gold(-daily.amount)
		print(daily.summary)

func set_work(work: WorkDefinition, daytime: bool):
	if daytime:
		if day_work:
			dailies.erase(day_work)
		day_work = work
	else:
		if night_work:
			dailies.erase(night_work)
		night_work = work
	add_daily(work)

#Skill checks
signal ask_for_roll(skill_id: String, difficulty: int, improve_roll: int)
signal roll_complete()

var roll = 0

func do_skill_check(skill_id: String, target: int, improve: bool = true):
	var val = get_skill(skill_id)
	if val < target and val + 20 >= target:
		var improve_roll = 0
		if improve:
			improve_roll = get_skill_up_roll(skill_id)
		ask_for_roll.emit(skill_id, target, improve_roll)
		await roll_complete
		if improve and roll >= improve_roll:
			#TODO : Skill improvement
			improve_skill(skill_id, 1)
		return val + roll
	else:
		return val

func get_skill_up_roll(skill_id: String) -> int:
	var r = 20 - get_stat(Database.skills[skill_id]._main_stat)
	if r > 20:
		return 20
	elif r < 1:
		return 1
	return r
