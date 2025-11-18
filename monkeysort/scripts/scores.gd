extends Label

var format_string = "SCORES\n==========\nRipe: %d\nRotten: %d\nUnripe: %d"

func _process(_delta):
	text = format_string % [
		Globals._scores[Banan.BananaType.RIPE],
		Globals._scores[Banan.BananaType.ROTTEN],
		Globals._scores[Banan.BananaType.UNRIPE],
	]
