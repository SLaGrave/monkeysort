class_name StrikeOutBoxes extends Node2D

@onready var subs: Array[StrikeOutBox] = [$One, $Two, $Three]


var idx: int = 0

func _ready():
	Globals.mistake_made.connect(inc)
	Globals.game_reset.connect(reset)

func inc():
	subs[idx].setme(true)
	idx += 1

func reset():
	idx = 0
	for sub in subs:
		sub.setme(false)
