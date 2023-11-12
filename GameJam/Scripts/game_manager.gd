extends Node2D

@export var expectedTime : float
@export var ghost_background : ParallaxBackground
@export var default_background : ParallaxBackground
var passed_time : float = 0
@onready var transition_anim : AnimationPlayer = get_node("TransitionCanvas/AnimationPlayer")
@onready var time_label : Label = get_node("TimerUI/TimeLabel") 

func _ready():
	transition_anim.play("transition2")
	LevelData.isInGhost = false
	if !GameMusic.is_playing():
		GameMusic.play()

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		RestartGame()
	if passed_time > expectedTime:
		time_label.modulate = Color("ff1a2d")

func _physics_process(delta):
	passed_time += delta
	if LevelData.isInGhost:
		ghost_background.visible = true
		default_background.visible = false
	else:
		ghost_background.visible = false
		default_background.visible = true
	


func RestartGame()->void:
	transition_anim.play("transition1")
	await get_tree().create_timer(1)
	get_tree().reload_current_scene()

func CanPassTheLevel()->bool:
	if passed_time <= expectedTime:
		return true
	return false
