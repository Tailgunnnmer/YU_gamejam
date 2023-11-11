extends Area2D


func _on_body_entered(body:Node2D):
	print("x")
	if body.is_in_group("player"):
		body.RestartLevel()
