extends Node

@onready var timer = $Timer

var locations: Array[Vector2]

const BANANAS = [
	preload("uid://doy6a4jif0gi0"),
	preload("uid://duo56lu5y52a4"),
	preload("uid://c5e0rqbp36ivb"),
]

func _ready():
	for child in $SpawnPoints.get_children():
		locations.append(child.position)
	timer.timeout.connect(spawn_banana)
	timer.start()

func spawn_banana():
	var instance: Banan = BANANAS.pick_random().instantiate()
	add_child(instance)
	instance.state = Banan.StateMachine.FALLING
	instance.apply_central_force(Vector2i(50000, 30000))
	instance.position = locations.pick_random()
