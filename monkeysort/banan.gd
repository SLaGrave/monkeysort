class_name Banan extends CharacterBody2D

var conveyor_speed: float = 100.0

@export var on_conveyor: bool = true

func _physics_process(delta: float) -> void:
	if on_conveyor:
		move_and_collide(delta * conveyor_speed * Vector2.DOWN)
