extends Area2D

@export var next_level_path : String
@export var game_manager : Node2D
var next_level : PackedScene
@export var ending_level : bool = false

func _ready():
	next_level = load(next_level_path)


func ChangeLevel()->void:
	get_tree().change_scene_to_packed(next_level)

func _on_body_entered(body:Node2D):
	if body.is_in_group("player"):
		if game_manager.CanPassTheLevel():
			if ending_level == true:
				LevelData.ending = true
				ChangeLevel()
			else:
				ChangeLevel()
		else:
			game_manager.RestartGame()
