extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Banan:
		if body.state != Banan.StateMachine.GRABBED:
			body.change_state(Banan.StateMachine.ON_CONVEYOR_EDGE)


func _on_body_exited(body: Node2D) -> void:
	if body is Banan:
		if body.state != Banan.StateMachine.GRABBED:
			body.change_state(Banan.StateMachine.FALLING)
