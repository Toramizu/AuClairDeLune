extends Node

signal time_change()

const Weekdays : Array[String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
const Seasons : Array[String] = ["Spring", "Summer", "Autumn", "Winter"]

const TimePerDay : int = 2
const DaysPerWeek : int = 7
const DaysPerMonth : int = 28
const MonthsPerYear : int = 4
const MoonPhases : int = 8

const TimePerWeek : int = TimePerDay * DaysPerWeek
const TimePerMonth : int = TimePerDay * DaysPerMonth
const TimePerYear : int = TimePerMonth * MonthsPerYear

var day_time : int
var day : int = 1
var month : int
var year : int = 1
var moon_delay : int = -2

var weekday : String :
	get :
		return Weekdays[day % DaysPerWeek]
var small_weekday : String :
	get :
		return weekday.substr(0, 3)
var season : String :
	get :
		return Seasons[month]

var total_time : int :
	get :
		return day_time + day * TimePerDay + month * TimePerMonth + year * TimePerYear
var moon_phase : int :
	get :
		@warning_ignore("integer_division")
		return (total_time/2 + moon_delay) % 8


var time_notes : Dictionary = {}
var time_trigger : Dictionary = {}

func advance_time():
	#Day-Night
	day_time += 1
	if day_time >= TimePerDay:
		#Advance Day
		day_time = 0
		day += 1
		if day > DaysPerMonth:
			#Advance Month
			day = 1
			month += 1
			if month >= MonthsPerYear:
				#Advance Year
				month = 0
				year += 1
	time_change.emit()


func add_time_note(id : String, delay : int = 0):
	time_notes[id] = total_time + delay
