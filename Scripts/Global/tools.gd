extends Node

var rng = RandomNumberGenerator.new()

func roll() -> int:
	return rng.randi_range(1, 20)

func roll_between(min: int, max: int) -> int:
	return rng.randi_range(min, max)

func pick(array: Array):
	return array[rng.randi_range(0, array.size() - 1)]

func check_condition_string(condition: String) -> bool:
	var exec = Expression.new()
	exec.parse(condition)
	return exec.execute()
