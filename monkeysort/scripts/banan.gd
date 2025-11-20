class_name Banan extends RigidBody2D

enum BananaType { RIPE, UNRIPE, ROTTEN }
enum StateMachine { ON_CONVEYOR, ON_CONVEYOR_EDGE, GRABBED, FALLING, ON_FLOOR }

@export var banana_type: BananaType

var state: StateMachine = StateMachine.ON_CONVEYOR

# Initial (on conveyor) settings
var speed := Globals.conveyor_speed
var direction := Vector2.LEFT

@onready var audio_grabbed = $Audio/Grabbed
@onready var audio_dropped = $Audio/Dropped
@onready var audio_hit_ground = $Audio/HitGround

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
	# The origin state matters for a few transitions
	var old_state = state
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
			audio_grabbed.play()
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
		StateMachine.ON_FLOOR:
			var fx = [0.3, 0.4, 0.5, 0.6, 0.7].pick_random() * [1, -1].pick_random() * 5000.0
			var fy = [0.5, 0.75, 1.0].pick_random() * -1 * 5000.0
			apply_impulse(Vector2(fx, fy))
	handle_audio(state, old_state)

func handle_audio(new_state, old_state):
	# Grabbing sound effect
	if new_state == StateMachine.GRABBED: audio_grabbed.play()
	# Dropping sound effect
	if old_state == StateMachine.GRABBED: audio_dropped.play()
	# HitGround sound effect
	if new_state == StateMachine.ON_FLOOR: audio_hit_ground.play()
