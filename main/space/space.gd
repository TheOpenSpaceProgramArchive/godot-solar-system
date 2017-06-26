extends Node2D

# Draw the sun in the middle of the viewport at 10x its normal size.
func _draw():
	draw_circle(global.get_viewport_center(), 10 * global.star_radius(), Color(255.0, 255.0, 255.0))
