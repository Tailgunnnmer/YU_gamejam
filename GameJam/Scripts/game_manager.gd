extends Node2D

@export var expectedTime : float
var passed_time : float = 0 

func _process(delta):
    if Input.is_action_just_pressed("restart"):
        RestartGame()

func _physics_process(delta):
    passed_time += delta

func RestartGame()->void:
    get_tree().reload_current_scene()
