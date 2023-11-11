extends Area2D

@export var move_speed : Vector2
@export var call_back_time : float 
var timer : float = -1

func _on_body_entered(body:Node2D):
	
	if body.is_in_group("player"):
		body.RestartLevel()

func _physics_process(delta):

	if timer <0:
		move_speed *= -1
		timer = call_back_time

	timer -=delta

	position += move_speed
