extends Node2D

# Mass of the Sun.
const sunMass = 1.989e30 # (kg)

func _ready():
	# Move the Sun to the center of the viewport.
	get_node("Sun").set_pos(global.get_viewport_center())
