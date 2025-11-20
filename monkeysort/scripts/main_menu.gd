extends Node2D

@onready var play_button = $VBoxContainer/PlayButton
@onready var settings_button = $VBoxContainer/SettingsButton

func _ready():
	play_button.pressed.connect(pressed_play)
	settings_button.pressed.connect(pressed_settings)

func pressed_play():
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")

func pressed_settings():
	print("Not Implemented Yet")
