extends Node2D

@export var expectedTime : float
var passed_time : float = 0
@onready var transition_anim : AnimationPlayer = get_node("TransitionCanvas/AnimationPlayer") 

func _ready():
	transition_anim.play("transition2")

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		RestartGame()

func _physics_process(delta):
	passed_time += delta

func RestartGame()->void:
	transition_anim.play("transition1")
	await get_tree().create_timer(1)
	get_tree().reload_current_scene()
