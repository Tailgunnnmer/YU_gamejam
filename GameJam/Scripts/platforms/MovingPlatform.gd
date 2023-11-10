extends CharacterBody2D

@export var move_speed : Vector2
@export var isMoving : bool
@export var turnBackTime : float
var timer : float

func _ready():
    timer = turnBackTime

func _physics_process(delta):
    
    if isMoving:
        velocity = move_speed

    timer -= delta
    if timer <0:
        move_speed *= -1
        timer = turnBackTime
    
    move_and_slide()