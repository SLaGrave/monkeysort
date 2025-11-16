class_name Banan extends CharacterBody2D

@export var on_conveyor: bool = true

# Initial (on conveyor) settings
var speed := GlobalSettings.conveyor_speed
var direction := Vector2.LEFT

func _physics_process(delta: float) -> void:
	if not on_conveyor:
		speed += delta * GlobalSettings.gravity
		direction = Vector2.DOWN
	move_and_collide(delta * speed * direction)
