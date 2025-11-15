extends Node2D

@export var color: Color

func _physics_process(delta):
	queue_redraw()

func _draw():
	draw_line(global_position, -global_position + get_global_mouse_position(), color, 40)
