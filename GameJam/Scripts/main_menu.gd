extends Control

@onready var anim : AnimationPlayer = get_node("AnimationPlayer")
@onready var color_rect : ColorRect = get_node("IntroCanvas/ColorRect")
@onready var intro = get_node("IntroCanvas")
@onready var outro = get_node("OutroCanvas")

@onready var level1 = preload("res://Scenes/Levels/level_1.tscn")
var skip : bool = false
var canSkip : bool=false

func _ready():
    await get_tree().create_timer(.5).timeout
    canSkip = true

    if LevelData.ending:
        print("s")
        PlayOutro()
    

func _on_button_pressed():
    get_tree().change_scene_to_packed(level1)

func _input(event):

    if event is InputEventMouseMotion:
        return
    if !LevelData.ending:
        if canSkip:
            if !skip &&  anim.is_playing():
                skip = true
                color_rect.visible = false
                intro.visible = false
                anim.stop()

func _on_animation_player_animation_finished(anim_name:StringName):
    if anim_name == "SkipableIntro":
        intro.visible = false
    if anim_name == "Outro":
        outro.visible = false

func PlayOutro()->void:
    GameMusic.stop()
    anim.stop()
    intro.visible = false
    outro.visible = true
    anim.play("Outro")

