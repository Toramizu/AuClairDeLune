class_name NameGenerator extends Resource

@export var first_names : Array[String] = ["Nameless"]
@export var last_names : Array[String] = ["Starchild"]

func generate_first_name(_gender: int, _variant: int = 0):
	return first_names.pick_random()

func generate_last_name():
	return last_names.pick_random()
