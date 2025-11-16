class_name Banan extends CharacterBody2D

enum BananaType { RIPE, UNRIPE, ROTTEN }

@export var banana_type: BananaType

@export var on_conveyor: bool = true

# Initial (on conveyor) settings
var speed := GlobalSettings.conveyor_speed
var direction := Vector2.LEFT

func _physics_process(delta: float) -> void:
	if not on_conveyor:
		speed += delta * GlobalSettings.gravity
		direction = Vector2.DOWN
	var collision_info = move_and_collide(delta * speed * direction)
	if collision_info:
		var collider = collision_info.get_collider()
		if collider is MS_Box:
			hit_a_box(collider)

func hit_a_box(box: MS_Box):
	if box.accepts == banana_type:
		GlobalSettings.increase_score(banana_type)
		queue_free()
