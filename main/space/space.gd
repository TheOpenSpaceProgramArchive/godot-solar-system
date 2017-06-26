extends Node2D

# Mass of the Sun.
const sunMass = 1.989e30 # (kg)

# Draw the sun at 10x its normal size.
func _draw():
	draw_circle(global.get_viewport_center(), 10 * global.radius(), Color(255.0, 255.0, 255.0))

func _ready():
	# Move the Sun to the center of the viewport.
	get_node("Sun").set_pos(global.get_viewport_center())
