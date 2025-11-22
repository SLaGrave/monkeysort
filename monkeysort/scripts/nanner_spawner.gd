extends Node

var banan = preload("res://scenes/banan.tscn")

@export var spawn_rate: Curve

@onready var main_game: Game = $".."


var locations: Array[Vector2]
var timer := Timer.new()

func _ready():
	for child in get_children():
		locations.append(child.position)
	add_child(timer)
	timer.wait_time = 1.0
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _on_timer_timeout() -> void:
	var instance: Banan = banan.instantiate()
	instance.banana_type = Banan.BananaType.values()[randi_range(0, main_game.level)]
	instance.add_to_group("banans")
	instance.z_index = 1
	get_parent().add_child(instance)
	instance.position = locations.pick_random()
	timer.wait_time = 1.0 / spawn_rate.sample(Globals.time_elapsed)
