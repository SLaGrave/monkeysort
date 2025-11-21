extends Node2D

@export var paw_color: Color
@export var arm_color: Color
var grabbed_item: Banan

var desired_power := 0.0
var power := 0.0
var last_mouse_position := Vector2()
func _physics_process(_delta) -> void:
	%HandArea.global_position = get_global_mouse_position()
	if grabbed_item != null:
		if Input.is_action_just_released("grab"):
			grabbed_item.change_state(Banan.StateMachine.FALLING)
			grabbed_item = null
			return
		#grabbed_item.global_position = %HandArea.global_position
	desired_power = -(get_global_mouse_position() - last_mouse_position)[0] * 4.0
	power = lerp(power, desired_power, 0.3)
	queue_redraw()
	last_mouse_position = get_global_mouse_position()

func _draw() -> void:
	var midway := Vector2(0, 0).lerp(%HandArea.position, 0.5)
	var cross := midway.rotated(PI / 2.0).normalized()
	var points: PackedVector2Array = []
	points.resize(100)
	var yoinky = func(x): return cross * (-1.0 / 2500.0 * (x - 50)**2 + 1)
	var sploinky = func(x): return cross * 10.0 * sin(x / 10.0 + Globals.time_elapsed)
	for i in range(100):
		var if_it_were_straight: Vector2 = lerp(Vector2(0, 0), %HandArea.position, i / 100.0)
		var end: Vector2 = if_it_were_straight + power * yoinky.call(i) + sploinky.call(i)
		points[i] = end
	
	draw_polyline(points.slice(0, 91), arm_color, 40, true)
	draw_circle(points[99], 20.0, paw_color, true)
	draw_polyline(points.slice(90, 100), paw_color, 40, true)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("grab"):
		var bodies: Array[Node2D] = %HandArea.get_overlapping_bodies()
		if not bodies.is_empty():
			if bodies[0] is Banan:
				grabbed_item = bodies[0]
				grabbed_item.change_state(Banan.StateMachine.GRABBED)
