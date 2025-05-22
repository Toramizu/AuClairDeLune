class_name SkillCheck extends Node

var skill_id: String
var targets: Array[int]
var improve_skill: bool

func _init(check_skill_id: String, check_targets: Array[int], check_improve_skill: bool = true):
	skill_id = check_skill_id
	targets = check_targets
	improve_skill = check_improve_skill
