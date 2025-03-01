extends RichTextLabel

func _ready():
	TimeManager.time_change.connect(write_time)
	write_time()

func write_time():
	text = "[center]%s %d, %s %d[/center]" % [TimeManager.weekday, TimeManager.day, TimeManager.season, TimeManager.year]
