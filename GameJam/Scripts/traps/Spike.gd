extends Area2D

@export var isInGhost : bool
@export var isCrossDim : bool


func _on_body_entered(body:Node2D):
	print("x")
	if body.is_in_group("player"):
		if (LevelData.isInGhost == isInGhost) || isCrossDim:
			body.RestartLevel()
