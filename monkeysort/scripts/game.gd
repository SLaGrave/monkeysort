extends Node2D


func _input(event):
	if event.is_action_pressed("close"):
		get_tree().quit()
