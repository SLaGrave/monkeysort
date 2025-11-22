extends Node

@export var spawnable_objects: Array[PackedScene]
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
	var instance: Banan = spawnable_objects.slice(0, main_game.level+1).pick_random().instantiate()
	instance.add_to_group("banans")
	instance.z_index = 1
	get_parent().add_child(instance)
	instance.position = locations.pick_random()
	timer.wait_time = 1.0 / spawn_rate.sample(Globals.time_elapsed)
