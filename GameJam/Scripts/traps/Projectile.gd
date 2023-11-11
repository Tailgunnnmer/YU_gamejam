extends Area2D

var move_speed : float
var direction : Vector2


func _physics_process(delta):
    position += direction * move_speed


func _on_body_entered(body:Node2D):
    if body.is_in_group("player"):
        body.RestartLevel()


func setupProjectile(dir : Vector2,speed :float)->void:
    move_speed =speed
    direction = dir

func _on_visible_on_screen_notifier_2d_screen_exited():
    queue_free()
