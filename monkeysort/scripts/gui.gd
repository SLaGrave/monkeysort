extends Control


func add_good_text(text: String):
	var label := Label.new()
	label.text = text
	label.set_anchors_preset(Control.PRESET_CENTER)
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.modulate = Color.GREEN
	add_child(label)
	label.pivot_offset = label.size / 2.0
	label.position = get_viewport().get_mouse_position()
	
	var tween := get_tree().create_tween().set_trans(Tween.TRANS_ELASTIC)
	tween.tween_method(func(x): label.rotation_degrees = x, 0, (randi() % 2 * 2 - 1) * 720, 2.0)
	tween.tween_callback(func(): label.queue_free())


func add_bad_text(text: String):
	var label := Label.new()
	label.text = text
	label.set_anchors_preset(Control.PRESET_FULL_RECT)
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	add_child(label)
	
	var tween := get_tree().create_tween().set_loops(3)
	var duration := 0.5
	tween.tween_property(label, "scale", Vector2(2.0, 2.0), duration)
	tween.parallel().tween_property(label, "modulate", Color.RED, duration)
	tween.parallel().tween_method(func(_x): label.pivot_offset = label.size / 2.0, 0, 0, duration)
	tween.tween_property(label, "scale", Vector2(1.0, 1.0), duration)
	tween.parallel().tween_property(label, "modulate", Color.WHITE, duration)
	tween.parallel().tween_method(func(_x): label.pivot_offset = label.size / 2.0, 0, 0, duration)
	tween.tween_callback(func (): if tween.get_loops_left() == 1: label.queue_free())

func add_win_text(text: String):
	var label := Label.new()
	label.text = text
	label.set_anchors_preset(Control.PRESET_FULL_RECT)
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	add_child(label)
	
	var tween := get_tree().create_tween().set_loops(3)
	var duration := 0.25
	tween.tween_property(label, "scale", Vector2(2.0, 2.0), duration)
	tween.parallel().tween_property(label, "modulate", Color.GREEN, duration)
	tween.parallel().tween_method(func(_x): label.pivot_offset = label.size / 2.0, 0, 0, duration)
	tween.tween_property(label, "scale", Vector2(1.0, 1.0), duration)
	tween.parallel().tween_property(label, "modulate", Color.WHITE, duration)
	tween.parallel().tween_method(func(_x): label.pivot_offset = label.size / 2.0, 0, 0, duration)
	tween.tween_callback(func (): if tween.get_loops_left() == 1: label.queue_free())
