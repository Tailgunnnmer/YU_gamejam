extends Node2D

@export var projectile : PackedScene
@export var direction : Vector2
@export var projectile_speed : float

func _on_timer_timeout():
    spawn_projectile()

func spawn_projectile()->void:
    var fireball = projectile.instantiate()
    fireball.setupProjectile(direction,projectile_speed)
    fireball.position = position
    get_tree().get_root().call_deferred("add_child",fireball)
