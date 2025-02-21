extends TextureRect

@export var moon_phases : Array[Texture]

func _ready():
	TimeManager.time_change.connect(set_phase)
	set_phase()

func set_phase():
	texture = moon_phases[TimeManager.moon_phase]
