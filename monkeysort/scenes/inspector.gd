extends Node2D

var front: Texture2D = preload("res://assets/monkey.png")
var back: Texture2D = preload("res://assets/monkey_back.png")
var hat_front: Texture2D = preload("res://assets/hat.png")
var hat_back: Texture2D = preload("res://assets/hat_back.png")

func face_front():
	%Monkey.texture = front
	%Hat.texture = hat_front

func face_back():
	%Monkey.texture = back
	%Hat.texture = hat_back
