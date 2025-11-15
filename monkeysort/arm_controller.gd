extends Node2D

@export var color: Color

func _physics_process(delta):
	%HandArea.global_position = get_global_mouse_position()
	queue_redraw()

func _draw():
	draw_line(Vector2(0, 0), %HandArea.global_position, color, 40)
