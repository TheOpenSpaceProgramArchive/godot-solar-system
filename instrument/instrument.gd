extends Node

func get_sun_node():
	return get_node("Space/Sun")

func get_earth_node():
	return get_node("Space/Earth")

func _ready():
	print(global.get_viewport_center())
