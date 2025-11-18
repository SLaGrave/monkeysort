extends Node2D


@export var level = 0:
	set = set_level

func _ready() -> void:
	Globals.mistake_made.connect(_on_mistake_made)

func _input(event):
	if event.is_action_pressed("close"):
		get_tree().quit()

func set_level(val: int):
	Globals.reset()
	level = val
	get_tree().call_group("banans", "queue_free")

func _on_mistake_made():
	if Globals._mistakes >= 3:
		# Restart the current level
		set_level(level)
