extends Node

@export var generator : NameGenerator
@export var npcs : Array[NPCDefinition]

@export var test_work : WorkDefinition

func run_debug():
	Npcs.contacts = npcs
	Player.day_work = test_work
	Player.character.skills["Mai"] = 20

func roll_test():
	print("Rolling...")
	#var roll = await %DiceRoller.ask_for_roll("Dan", 20, 0)
	#print(roll)
	#var t = await Player.do_skill_check(SkillCheck.new("Dan", [10, 20, 30]))
	var t = await Player.do_skill_check("Dan", 20)
	print(t)

func ding():
	print(generator.generate_first_name(1) + " " + generator.generate_last_name())
