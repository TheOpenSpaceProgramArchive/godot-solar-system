extends Node

# Find the center of the viewport.
func get_viewport_center():
	return Vector2(get_viewport().get_rect().size.width/2, get_viewport().get_rect().size.height/2)
