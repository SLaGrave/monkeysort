extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Banan:
		if body.state == Banan.StateMachine.FALLING \
			or (body.state == Banan.StateMachine.ON_FLOOR \
			and body.linear_velocity.length() < 1000):
			body.change_state(Banan.StateMachine.ON_CONVEYOR)
