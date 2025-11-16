extends Node

@export var conveyor_speed: float = 100.0
@export var gravity: float = 100.0

#******************************************************************************#
#                     Score Keeping                                            #
#******************************************************************************#
var _scores: Dictionary = {
	Banan.BananaType.RIPE: 0,
	Banan.BananaType.UNRIPE: 0,
	Banan.BananaType.ROTTEN: 0,
}

func increase_score(bt: Banan.BananaType):
	_scores[bt] += 1
