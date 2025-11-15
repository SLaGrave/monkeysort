extends Node2D

@onready
var color_rect: ColorRect = $ColorRect

func _physics_process(delta):
	position = get_viewport().get_mouse_position()
	queue_redraw()

func _draw():
	draw_line(Vector2(0, 0), Vector2(640, 750) - position, color_rect.color, 40)
