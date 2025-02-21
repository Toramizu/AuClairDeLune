extends RichTextLabel

func _ready():
	TimeManager.time_change.connect(write_time)
	write_time()

func write_time():
	text = "[center]%d %s\n%s Year %d[/center]" % [TimeManager.day, TimeManager.weekday, TimeManager.season, TimeManager.year]
