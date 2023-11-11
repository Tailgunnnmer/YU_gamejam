@tool
extends Node2D

var platforms : Array
var orbit_angle_offset = 0
@export var radius : Vector2
@export var rotation_duration : float = 4

func _ready():
	find_platforms()

func _physics_process(delta):
	orbit_angle_offset += 2 * PI * delta / float(rotation_duration)
	orbit_angle_offset = wrapf(orbit_angle_offset,-PI,PI)
	update_platforms()

func update_platforms()->void:
	if platforms.size() !=0:
		var spacing = 2 * PI / float(platforms.size())
		for i in platforms.size():
			var newPos = Vector2()
			newPos.x = cos(spacing * i + orbit_angle_offset) * radius.x
			newPos.y = sin(orbit_angle_offset + spacing * i) * radius.y
			platforms[i].position = newPos


func find_platforms()->void:
	platforms = []
	for child in get_children():
		if child.is_in_group("platform"):
			child.isInOrbital = true
			platforms.append(child)
			
