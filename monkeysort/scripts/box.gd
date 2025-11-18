class_name BananBox extends Area2D

@export var accepts: Banan.BananaType

@onready var audio_correct: AudioStreamPlayer2D  = $AudioCorrect
@onready var audio_incorrect: AudioStreamPlayer2D = $AudioIncorrect

func _ready() -> void:
	body_entered.connect(_on_body_entered)

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
