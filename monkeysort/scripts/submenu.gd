extends Node2D

@onready var back_button = $VBoxContainer/BackButton

func _ready():
	back_button.pressed.connect(go_back)

func go_back():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
