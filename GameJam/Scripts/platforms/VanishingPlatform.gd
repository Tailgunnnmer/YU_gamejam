extends CharacterBody2D

@onready var sprite : Sprite2D = get_node("Sprite2D")
@onready var collision : CollisionShape2D = get_node("CollisionShape2D")

@export var vanish_time : float = 2
@export var recreate_time : float = 5
@export var isInGhost : bool 

var isVanishing : bool = false

func _on_area_2d_body_entered(body:Node2D):
	print("s")
	if body.is_in_group("player") && !isVanishing:
		if isInGhost == LevelData.isInGhost:
			vanish()
		

func vanish()->void:
	isVanishing = true
	var tween = get_tree().create_tween()
	tween.tween_property(sprite,"self_modulate",Color("ffc56e00"),vanish_time)
	await tween.finished
	collision.set_deferred("disabled",true)
	tween.kill()
	reCreate()

func reCreate()->void:
	await get_tree().create_timer(recreate_time).timeout
	var tween = get_tree().create_tween()
	tween.tween_property(sprite,"self_modulate",Color("ffffff"),.4)
	collision.set_deferred("disabled",false)
	await tween.finished
	tween.kill()
	isVanishing = false
