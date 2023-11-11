extends Node

var level_time_dict : Dictionary = {
	"Level1":-1,
	"Level2":-1,
	"Level3":-1,
	"Level4":-1,
	"Level5":-1
}

var isInGhost : bool

func _ready():
	isInGhost = false
