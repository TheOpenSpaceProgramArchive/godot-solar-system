extends Node2D

# Gravitational constant.
# https://en.wikipedia.org/wiki/Gravitational_constant
const G = 6.67408e-11 # m^3 / kg^1 / s^2

# Astronomical unit.
# https://en.wikipedia.org/wiki/Astronomical_unit
const AU = 1.495987e11 # m

# Solar Mass.
# https://en.wikipedia.org/wiki/Solar_mass
const SOLAR_MASS = 1.99e30 # kg

# Stellar mass.
# https://en.wikipedia.org/wiki/Stellar_mass
# Stellar mass range of typical G-type main-sequence stars:
# 0.84 M(*) <-----------> 1.15 M(*)
var stellar_mass = 1.0 # M(*)

# Standard gravitational parameter.
# https://en.wikipedia.org/wiki/Standard_gravitational_parameter
var u = G * SOLAR_MASS * stellar_mass # m^3 / s^2

# Surface gravity.
# https://en.wikipedia.org/wiki/Surface_gravity
# Surface gravity range of typical G-type main-sequence stars.
# log g = 4.48 <-----------> log g = 4.32
var log_g = 4.44 # cgs

# Stellar radius.
# Derived from the star's surface gravity and standard gravitational parameter.
var stellar_radius = sqrt(100 * u / pow(10, log_g)) # m

# Astronical unit in pixels.
# The AU will be 1/8th the viewport height.
func au():
	return get_viewport().get_rect().size.height / 8 # px

func _draw():
	# Radius of the sun (20x larger than scale).
	var radius = 20 * au() * stellar_radius / AU # px
	# Color of the sun (The sun is white in space).
	var color = Color(1.0, 1.0, 1.0) # white
	# Position of the sun.
	var sun_pos = Vector2(0.0, 0.0)
	# Draw the sun.
	draw_circle(sun_pos, radius, color)
	# Draw a helpful reference axis.
	draw_line(sun_pos, Vector2(2 * au(), 0.0), Color(0.0, 0.0, 0.0), 1.0)

func _ready():
	# Connect signal to resize() function.
	get_viewport().connect("size_changed", self, "resize")
	# Center the star on ready.
	set_pos(Vector2(get_viewport().get_rect().size.width / 2, 3 * au())) # px

# Re-center the star when the viewport is resized.
func resize():
	set_pos(Vector2(get_viewport().get_rect().size.width / 2, 3 * au())) # px
