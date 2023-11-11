extends StaticBody2D


@export var bounce_direction  : Vector2 = Vector2.UP
@export var jump_force : float
@onready var animator:AnimationPlayer = $AnimationPlayer


func _on_jump_area_body_entered(body:Node2D):
	if body.is_in_group("player"):
		animator.play('bounce')
		body.velocity += jump_force * bounce_direction

func be_bounced(bouncer)->void:
	bouncer.bounce(jump_force)
	animator.play('bounce')
