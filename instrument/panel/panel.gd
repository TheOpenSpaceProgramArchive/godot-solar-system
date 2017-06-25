extends Panel

func _ready():
	get_node("Real Time").set_pos(Vector2(0.0, 0.0))
	get_node("Orbital Speed").set_pos(Vector2(0.0, 18.0))
	get_node("Angle").set_pos(Vector2(0.0, 36.0))