extends Node

var rng = RandomNumberGenerator.new()

func roll() -> int:
	return rng.randi_range(1, 20)

func check_condition_string(condition: String) -> bool:
	var exec = Expression.new()
	exec.parse(condition)
	return exec.execute()
