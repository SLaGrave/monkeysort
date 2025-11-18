class_name Banan extends RigidBody2D

enum BananaType { RIPE, UNRIPE, ROTTEN }
enum StateMachine { ON_CONVEYOR, ON_CONVEYOR_EDGE, GRABBED, FALLING }

@export var banana_type: BananaType

var state := StateMachine.ON_CONVEYOR

# Initial (on conveyor) settings
var speed := Globals.conveyor_speed
var direction := Vector2.LEFT


func _ready() -> void:
	change_state(state)

func _process(_delta: float) -> void:
	mouse_position = get_global_mouse_position()
	mouse_direction = mouse_position - old_mouse_position
	old_mouse_position = mouse_position

func _physics_process(_delta: float) -> void:
	match state:
		StateMachine.ON_CONVEYOR:
			linear_velocity = speed * direction
		StateMachine.GRABBED:
			apply_central_force(500.0 * (mouse_position - global_position))


var mouse_direction: Vector2 = Vector2()
var old_mouse_position: Vector2 = Vector2()
var mouse_position: Vector2 = Vector2()

func change_state(new_state: StateMachine):
	state = new_state
	# On entering new state
	match state:
		StateMachine.ON_CONVEYOR:
			gravity_scale = 0.0
			speed = Globals.conveyor_speed
			direction = Vector2.LEFT
			linear_damp = 0.0
		StateMachine.ON_CONVEYOR_EDGE:
			gravity_scale = 0.0
			speed = 0.0
			linear_damp = 20.0
		StateMachine.GRABBED:
			gravity_scale = 0.0
			collision_layer = 0
			collision_mask = 0
			linear_velocity = Vector2(0.0, 0.0)
			linear_damp = 30.0
		StateMachine.FALLING:
			gravity_scale = 1.0
			collision_layer = 1
			collision_mask = 1
			linear_damp = 0.0
