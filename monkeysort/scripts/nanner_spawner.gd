extends Node

@export var spawnable_objects: Array[PackedScene]
@export var spawn_rate: Curve


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
	print(locations.pick_random())
	var instance: Banan = spawnable_objects.pick_random().instantiate()
	instance.add_to_group("banans")
	get_parent().add_child(instance)
	instance.position = locations.pick_random()
	timer.wait_time = 1.0 / spawn_rate.sample(Globals.time_elapsed)
