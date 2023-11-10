extends StaticBody2D


@export var bounce_direction  : Vector2 = Vector2.UP
@export var jump_force : float


func _on_jump_area_body_entered(body:Node2D):
	if body.is_in_group("player"):
		body.velocity += jump_force * bounce_direction
