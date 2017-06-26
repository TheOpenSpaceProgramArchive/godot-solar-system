extends Panel

func _ready():
	set_pos(Vector2(global.get_viewport_center().x / 2, 0.0))
	set_size(Vector2(global.get_viewport_center().x, global.get_viewport_center().y / 3))
	
	get_node("Real Time").set_pos(Vector2(0.0, 0.0))
	get_node("Time Warp").set_pos(Vector2(0.0, 18.0))
	get_node("Orbital Speed").set_pos(Vector2(0.0, 36.0))
	get_node("Angle").set_pos(Vector2(0.0, 54))
