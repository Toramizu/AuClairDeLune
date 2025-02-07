extends Node

var rng = RandomNumberGenerator.new()

func roll() -> int:
	return rng.randi_range(1, 20)
