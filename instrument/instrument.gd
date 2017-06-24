extends Node

func get_sun_node():
	return get_node("Space/Sun")
	
func get_earth_node():
	return get_node("Space/Earth")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	print(global.get_viewport_center())
