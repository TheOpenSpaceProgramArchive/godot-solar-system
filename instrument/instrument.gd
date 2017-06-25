extends Node

func get_sun_node():
	return get_node("Space/Sun")

func get_earth_node():
	return get_node("Space/Earth")
	
func axis_length():
	return 2 * global.au()
