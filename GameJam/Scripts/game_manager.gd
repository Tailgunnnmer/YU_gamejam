extends Node2D



func _process(delta):
	if Input.is_action_just_pressed("restart"):
		RestartGame()



func RestartGame()->void:
	get_tree().reload_current_scene()
