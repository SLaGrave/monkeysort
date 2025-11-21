extends Node2D

@onready var play_button = $VBoxContainer/PlayButton
@onready var how_to_play_button = $VBoxContainer/HowToPlayButton
@onready var credits_button = $VBoxContainer/CreditsButton

func _ready():
	play_button.pressed.connect(pressed_play)
	how_to_play_button.pressed.connect(pressed_how_to_play)
	credits_button.pressed.connect(pressed_credits)

func pressed_play():
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")

func pressed_how_to_play():
	get_tree().change_scene_to_file("res://scenes/how_to_play_menu.tscn")

func pressed_credits():
	get_tree().change_scene_to_file("res://scenes/credits_menu.tscn")
