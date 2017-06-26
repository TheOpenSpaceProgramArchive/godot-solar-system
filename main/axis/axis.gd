extends Control

# Length of the axis
const axisLength = 2 # AU

func _draw():
	# Start point.
	var from = global.get_viewport_center()
	# End Point.
	var to = global.get_viewport_center() + Vector2(axisLength * global.au(), 0.0)
	
	# Draw the axis.
	draw_line(from, to, Color(0.0, 0.0, 0.0), 1.0)
	
	# Tag the axis.
	get_node("Angle").set_pos(to + Vector2(0.0, -18.0))
	get_node("Length").set_pos(to + Vector2(0.0, 6.0))
