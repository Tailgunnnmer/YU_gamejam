extends Control

@onready var anim : AnimationPlayer = get_node("AnimationPlayer")
@onready var color_rect : ColorRect = get_node("IntroCanvas/ColorRect")
@onready var intro = get_node("IntroCanvas")

@onready var level1 = preload("res://Scenes/Levels/level_1.tscn")
var skip : bool = false
var canSkip : bool=false

func _ready():
    await get_tree().create_timer(1).timeout
    canSkip = true
    intro.visible = false

func _on_button_pressed():
    get_tree().change_scene_to_packed(level1)

func _input(event):
    
    if event!= InputEventMouseMotion:
            if canSkip&&!skip && event && anim.is_playing():
                skip = true
                color_rect.visible = false
                anim.stop()