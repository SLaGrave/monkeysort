class_name Banan extends RigidBody2D

enum BananaType { RIPE, UNRIPE, ROTTEN }
enum StateMachine { ON_CONVEYOR, GRABBED, FALLING }

@export var banana_type: BananaType

var state := StateMachine.ON_CONVEYOR

# Initial (on conveyor) settings
var speed := Globals.conveyor_speed
var direction := Vector2.LEFT

func _physics_process(delta: float) -> void:
	match state:
		StateMachine.ON_CONVEYOR:
			freeze = false
			gravity_scale = 0.0
			speed = 100.0
			direction = Vector2.LEFT
		StateMachine.GRABBED:
			collision_layer = 0
			collision_mask = 0
			freeze = true
		StateMachine.FALLING:
			gravity_scale = 1.0
			collision_layer = 1
			collision_mask = 1
			freeze = false
			direction = Vector2.DOWN
		
	var collision_info = move_and_collide(delta * speed * direction)
	if collision_info:
		var collider = collision_info.get_collider()
		if collider is MS_Box:
			hit_a_box(collider)

func hit_a_box(box: MS_Box):
	if box.accepts == banana_type:
		Globals.increase_score(banana_type)
		queue_free()
