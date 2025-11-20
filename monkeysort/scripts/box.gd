class_name BananBox extends Area2D

@export var accepts: Banan.BananaType

@onready var main_game = $".."
@onready var collision_shape_2d = $CollisionShape2D

@onready var audio_correct: AudioStreamPlayer2D  = $AudioCorrect
@onready var audio_incorrect: AudioStreamPlayer2D = $AudioIncorrect

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	Globals.game_reset.connect(set_visibility)
	set_visibility()

func set_visibility():
	collision_shape_2d.disabled = false
	visible = true
	match accepts:
		Banan.BananaType.ROTTEN:
			if main_game.level < 1:
				collision_shape_2d.disabled = true
				visible = false
		Banan.BananaType.UNRIPE:
			if main_game.level < 2:
				collision_shape_2d.disabled = true
				visible = false
	queue_redraw()

func _on_body_entered(body):
	if body is Banan:
		if body.banana_type == accepts:
			Globals.increase_score(accepts)
			body.queue_free()
			audio_correct.play()
		else:
			Globals.increase_mistakes()
			body.queue_free()
			audio_incorrect.play()
