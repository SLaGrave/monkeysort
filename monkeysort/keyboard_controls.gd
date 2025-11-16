extends Node


func _input(event):
	if event.is_action_pressed("ms_close"):
		get_tree().quit()
