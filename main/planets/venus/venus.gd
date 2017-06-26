extends "res://main/planets/planets.gd"

# Color of the planet
var color = Color(1.0, 1.0, 0.0)

# Radius of the planet.
var radius = 0.95 # Ro

# Semi-major axis of the orbit.
var semiMajorAxisRatio = 0.72 # AU

# Semi major axis of the orbit.
var semiMajorAxis = semi_major_axis(semiMajorAxisRatio) # m

# Orbital Speed of the planet.
var orbitalSpeed = orbital_speed(semiMajorAxis) # m/s

# Draw the planet.
func _draw():
	draw_circle(get_pos(), DRAW_SCALE * radius(radius), color)

func _process(delta):
	# Find your position.
	var position = get_pos()
	# Find the Sun's position.
	var sunPosition = global.get_viewport_center()
	# Process the angle.
	theta += time_warp() * delta * orbitalSpeed / semiMajorAxis
	if (theta > 2 * PI):
		theta -= 2 * PI
	# Update your position.
	position.x = sunPosition.x + (cos(theta) * semiMajorAxisRatio * global.au())
	position.y = sunPosition.y - (sin(theta) * semiMajorAxisRatio * global.au())
	# Set the new position.
	set_pos(position)
