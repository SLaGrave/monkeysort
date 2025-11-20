extends Node

@export var conveyor_speed: float = 500.0
@export var gravity: float = 100.0

@export var mistakes_allowed: int = 3

var time_elapsed: float

signal score_increased
signal mistake_made
signal game_reset

func reset():
	time_elapsed = 0
	_mistakes = 0
	for key in _scores:
		_scores[key] = 0
	game_reset.emit()

#******************************************************************************#
#                     Score Keeping                                            #
#******************************************************************************#
var _mistakes := 0
var _scores: Dictionary = {
	Banan.BananaType.RIPE: 0,
	Banan.BananaType.UNRIPE: 0,
	Banan.BananaType.ROTTEN: 0,
}

func increase_score(bt: Banan.BananaType):
	_mistakes = 0  # Reset the mistakes
	_scores[bt] += 1
	score_increased.emit()

func increase_mistakes():
	_mistakes += 1
	mistake_made.emit()
