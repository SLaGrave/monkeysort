extends Node2D


@export var level = 0:
	set = set_level

func _ready() -> void:
	Globals.mistake_made.connect(_on_mistake_made)
	Globals.score_increased.connect(_on_score_increased)

func _input(event):
	if event.is_action_pressed("close"):
		get_tree().quit()

func set_level(val: int):
	Globals.reset()
	level = val
	get_tree().call_group("banans", "queue_free")

func _on_score_increased():
	%GUI.add_good_text("Nice!")

func _on_mistake_made():
	
	if Globals._mistakes >= 3:
		# Restart the current level
		%GUI.add_bad_text("You Lost!")
		set_level(level)
	else:
		%GUI.add_bad_text("Mistake!")
