extends Area2D

@export var isInGhost : bool
@export var isCrossDim : bool
@export var dimensionManager : Node2D

func _on_body_entered(body:Node2D):
	print("x")
	if body.is_in_group("player"):
		if (dimensionManager.IsPlayerInGhostDimension() == isInGhost) || isCrossDim:
			body.RestartLevel()
