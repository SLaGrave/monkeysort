extends Node2D

@export var color: Color
var grabbed_item: Banan

func _physics_process(_delta) -> void:
	%HandArea.global_position = get_global_mouse_position()
	if grabbed_item != null:
		if Input.is_action_just_released("grab"):
			grabbed_item.state = Banan.StateMachine.FALLING
			grabbed_item = null
			return
		grabbed_item.global_position = %HandArea.global_position
	queue_redraw()


func _draw() -> void:
	draw_line(Vector2(0, 0), %HandArea.position, color, 40)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("grab"):
		var bodies: Array[Node2D] = %HandArea.get_overlapping_bodies()
		if not bodies.is_empty():
			if bodies[0] is Banan:
				grabbed_item = bodies[0]
				grabbed_item.state = Banan.StateMachine.GRABBED
