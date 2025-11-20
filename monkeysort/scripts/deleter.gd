extends Area2D


func _on_body_entered(body):
	print("HEY")
	body.queue_free()
