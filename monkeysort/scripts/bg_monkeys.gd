extends Sprite2D

@export var DEG: float = 20
@export var LEN: float = 0.75

func _ready():
	DEG *=[1, -1].pick_random()
	var tween := get_tree().create_tween()
	tween.set_trans(Tween.TRANS_EXPO)
	tween.set_loops()
	tween.tween_method(func(x): rotation = deg_to_rad(x), -DEG, DEG, LEN)
	tween.tween_method(func(x): rotation = deg_to_rad(x), DEG, -DEG, LEN)
	#tween.tween_method(func(x): rotation_degrees = x, 0, (randi() % 2 * 2 - 1) * 720, 2.0)
	#tween.tween_callback(func(): queue_free())
