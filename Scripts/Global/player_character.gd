extends Node

class Earning:
	var amount: int
	var description: String
	func _init(amnt: int, descr: String):
		amount = amnt
		description = descr

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
		SignalBus.stats_changed.emit()
var mp :
	get :
		return mental
	set(value) :
		mental = value
		SignalBus.stats_changed.emit()
var ap :
	get :
		return aro
	set(value) :
		aro = value
		SignalBus.stats_changed.emit()

var gold : int
var earnings : Dictionary[String, Earning] = {}
var total_earnings:
	get:
		var val = 0
		for earn in earnings.values():
			val += earn.amount
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


func _ready():
	character = player_def.duplicate()
	character._complete_load()
	hp = character.max_hp
	mp = character.max_mp
	ap = character.max_ap
	gold = character.starting_gold
	earnings["Test"] = Earning.new(20, "Testing pay")

func get_stat(stat: String) -> int:
	return character.get_stat(stat)

func get_stat_mod(stat: String, sub: bool = false) -> int:
	return character.get_stat_mod(stat, sub)

func get_skill(skill: String) -> int:
	return character.get_skill(skill)

func earn_gold(amount: int):
	gold += amount
	SignalBus.gold_change.emit()

func check_gold(amount: int):
	return gold >= amount

func add_earnings(id: String, amount: int, descr: String):
	if amount == 0:
		remove_earning(id)
	else:
		earnings[id] = Earning.new(amount, descr)
		SignalBus.gold_change.emit()

func remove_earning(id: String):
	earnings.erase(id)
	SignalBus.gold_change.emit()

func earn_earnings():
	earn_gold(total_earnings)

signal ask_for_roll(skill_id: String, difficulty: int)
signal roll_complete()

var roll = 0

func do_skill_check(check: SkillCheck):
	var val = get_skill(check.skill_id)
	var t = 0
	roll = 0
	for target in check.targets:
		if val + roll >= target:
			if t < target : t = target
		elif roll == 0:
			ask_for_roll.emit(check.skill_id, target)
			await roll_complete
			#TODO : Notify skill improvement
			character.skills[check.skill_id] += 1
			if val + roll >= target:
				if t < target : t = target
	return t
