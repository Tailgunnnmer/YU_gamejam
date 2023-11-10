extends CanvasLayer

var passed_time : float

@onready var time_label : Label = get_node("TimeLabel")
var time_str: String = "00:00:00"

func _physics_process(delta):
	passed_time += delta
	
	time_label.text = time_to_minutes_secs_mili(passed_time)
	


func time_to_minutes_secs_mili(time : float)->String:
	var time_str : String = ""
	var mins = int(time) / 60
	if mins <10:
		time_str += "0" 
	time_str += str(mins) + ":"
	time -= mins * 60
	var secs = int(time) 
	if secs <10:
		time_str += "0" 
	time_str += str(secs) + ":"
	var mili = int((time - int(time)) * 100)
	if mili <10:
		time_str += "0" 
	time_str += str(mili)

	return  time_str


func SavePassedTime(level_name : String)->void:
	LevelData.level_time_dict[level_name] = passed_time