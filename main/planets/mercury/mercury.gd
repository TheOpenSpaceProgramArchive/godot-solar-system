extends Node2D

# Color of the planet
var color = Color(1.0, 0.0, 0.0)

# Radius of the planet.
var radius = 0.3829 # Ro

# Radius of the planets.
func radius(r):
	return 1000 * global.au() * r * global.EARTH_RADIUS / global.AU # px

# Semi-major axis of the orbit.
var semiMajorAxisRatio = 0.39 # AU

# Semi major axis of the orbit.
var semiMajorAxis = semi_major_axis() # m

func orbital_speed(semiMajorAxis):
    return sqrt((global.G * global.stellarMass) / semiMajorAxis) # m/s

# Orbital Speed of the planet.
var orbitalSpeed = orbital_speed(semiMajorAxis) # m/s

var DRAW_SCALE = 700

func semi_major_axis():
	return semiMajorAxisRatio * global.EARTH_RADIUS

var theta = 0

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
