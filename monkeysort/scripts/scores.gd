extends Label

var format_string = "Level: %d"
@onready var main_game = $".."

func _process(_delta):
	text = format_string % (main_game.level + 1)
