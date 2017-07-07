extends "res://solar_system/universe.gd"

func _draw():
	var radius = au() * stellar_radius / AU # px
	var color = Color(1.0, 1.0, 1.0) # white
	draw_circle(Vector2(0.0, 0.0), 20 * radius, color)
