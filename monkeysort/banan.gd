class_name Banan extends CharacterBody2D

var conveyor_speed: float = 100.0

@export var on_conveyor: bool = true
var speed := 100.0
var direction := Vector2.LEFT
var gravity := 100.0

func _physics_process(delta: float) -> void:
	if on_conveyor:
		speed = 100.0
		direction = Vector2.LEFT
	else:
		speed += delta * gravity
		direction = Vector2.DOWN
		
	move_and_collide(delta * speed * direction)
