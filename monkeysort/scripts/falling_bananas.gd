extends Node

@onready var timer = $Timer

var locations: Array[Vector2]


func _ready():
	for child in $SpawnPoints.get_children():
		locations.append(child.position)
	timer.timeout.connect(spawn_banana)
	timer.start()

func spawn_banana():
	var instance: Banan = Globals.BANAN_SCENE.instantiate()
	instance.banana_type = Banan.BananaType.values()[randi_range(0, 2)]
	add_child(instance)
	instance.state = Banan.StateMachine.FALLING
	instance.apply_central_force(Vector2i(50000, 30000))
	instance.position = locations.pick_random()
