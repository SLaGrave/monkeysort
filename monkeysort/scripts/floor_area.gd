extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("AAAAAAAAAAAAA")
	if body is Banan:
		if body.state != Banan.StateMachine.GRABBED:
			body.change_state(Banan.StateMachine.ON_FLOOR)
