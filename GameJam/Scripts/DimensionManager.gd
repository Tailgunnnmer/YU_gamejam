extends Node2D

@export var ghost_dimension : Node2D
@export var default_dimension : Node2D
@export var crossover_dimension : Node2D
@export var player : CharacterBody2D

@export var teleportSound : AudioStreamPlayer 

enum dimensions {GHOST,DEFAULT}
var current_player_dimension : dimensions = dimensions.DEFAULT

func _ready():
	VanishDimension(ghost_dimension)
	ResetDimension(default_dimension)


func _process(delta):

	if Input.is_action_just_pressed("dimension_change"):
		teleportSound.play()
		match current_player_dimension:
			dimensions.DEFAULT:
				current_player_dimension = dimensions.GHOST
				VanishDimension(default_dimension)
				ResetDimension(ghost_dimension)
				player.set_collision_mask_value(2,true)
				player.set_collision_mask_value(3,false)
				
				player.SetRayCastCollisionsGhost()
				

			dimensions.GHOST:
				current_player_dimension = dimensions.DEFAULT
				VanishDimension(ghost_dimension)
				ResetDimension(default_dimension)
				player.set_collision_mask_value(2,false)
				player.set_collision_mask_value(3,true)
		
				player.SetRayCastCollisionsDefault()

		LevelData.isInGhost = IsPlayerInGhostDimension()

func VanishDimension(dimension : Node2D)->void:
	var dimension_objects : Array = dimension.get_children()
	for obj in dimension_objects:
		obj.modulate.a = .4

func ResetDimension(dimension : Node2D)->void:
	var dimension_objects : Array = dimension.get_children()
	for obj in dimension_objects:
		obj.modulate.a = 1

func IsPlayerInGhostDimension()->bool:
	match current_player_dimension:
			dimensions.DEFAULT:
				return false
				
			dimensions.GHOST:
				return true
	return false
				