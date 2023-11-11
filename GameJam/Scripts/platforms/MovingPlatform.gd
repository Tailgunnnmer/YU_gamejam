extends CharacterBody2D

@export var move_speed : Vector2
@export var isMoving : bool
@export var turnBackTime : float
var timer : float
var constY 

func _ready():
	timer = turnBackTime
	constY = global_position.y

func _physics_process(delta):
	
	if isMoving:
		velocity = move_speed
	else:
		global_position.y = constY

	timer -= delta
	if timer <0:
		move_speed *= -1
		timer = turnBackTime
	
	move_and_slide()
