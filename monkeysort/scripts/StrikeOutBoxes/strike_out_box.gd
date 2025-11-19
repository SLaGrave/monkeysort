class_name StrikeOutBox extends Node

@onready var good = $Good
@onready var bad = $Bad

func _ready():
	setme(false)

func setme(value: bool):
	good.visible = not value
	bad.visible = value
