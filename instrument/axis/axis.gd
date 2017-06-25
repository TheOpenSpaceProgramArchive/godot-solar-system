extends Control

func _draw():
	# Start point.
	var from = global.get_viewport_center()
	# End Point.
	var to = global.get_viewport_center() + Vector2(get_parent().axis_length(), 0.0)
	
	# Draw the axis.
	draw_line(from, to, Color(0.0, 0.0, 0.0), 1.0)
	
	# Tag the axis.
	get_node("Angle").set_pos(to + Vector2(0.0, -18.0))
	get_node("Length").set_pos(to + Vector2(0.0, 6.0))
