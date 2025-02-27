extends RichTextLabel

func _ready():
	TimeManager.time_change.connect(write_time)
	write_time()

func write_time():
	text = "[center]%s. %d\n%s[/center]" % [TimeManager.small_weekday, TimeManager.day, TimeManager.season]
