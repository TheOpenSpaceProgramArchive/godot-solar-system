extends Control

# Gravitational constant. https://en.wikipedia.org/wiki/Gravitational_constant
const G = 6.67408e-11 # m^3 / kg^1 / s^2

# Astronomical unit.
const AU = 1.495987e11 # m

# Solar Mass. https://en.wikipedia.org/wiki/Solar_mass
const SOLAR_MASS = 1.99e30 # kg

# Stellar mass. https://en.wikipedia.org/wiki/Stellar_mass
# Stellar mass range of typical G-type main-sequence stars:
# 0.84 M(*) <-----------> 1.15 M(*)
export var stellar_mass = 1.0 # M(*)
signal stellar_mass

# Standard gravitational parameter. https://en.wikipedia.org/wiki/Standard_gravitational_parameter
var u = G * SOLAR_MASS * stellar_mass # m^3 / s^2

# Surface gravity. https://en.wikipedia.org/wiki/Surface_gravity
# Surface gravity range of typical G-type main-sequence stars.
# log g = 4.48 <-----------> log g = 4.32
export var log_g = 4.44 # cgs

# Stellar radius.
# Derived from surface gravity and standard gravitational parameter.
var stellar_radius = sqrt(100 * u / pow(10, log_g)) # m

#######################
##### EARTH STUFF #####
#######################

# Earth radius. https://en.wikipedia.org/wiki/Earth_radius
const EARTH_RADIUS = 6371 # km




func shit():
	print("shit")

# Default planets.
#var earth = {
#	mass = 1.0, # M(+)
#	semimajor_axis = 149.60e6 * 1000, # m
#	eccentricity = 0.0
#}

#var orbital_speed = sqrt(u / earth["semimajor_axis"])

# Sub-scene(s).
var planet = load("res://planet/planet.tscn").instance()

export var semimajor_axis = 149.6e9 # km

func orbital_velocity(a):
	return sqrt(u/a)

# Add the sub-scene(s).
func _ready():
	connect("shit", self, "shit")
	emit_signal("stellar_mass")
	var au = get_pos().y / 3 # px
	planet.u = u
	planet.au = au
	planet.semimajor_axis = semimajor_axis # km
	planet.orbital_speed = orbital_velocity(semimajor_axis)
	#planet.orbital_speed = orbital_speed
	#planet.semimajor_axis = 149.6e6 # km
	#planet.initialize(earth["mass"], earth["semimajor_axis"], earth["eccentricity"], 4)
	#print(planet.orbital_speed)
	add_child(planet)

#############################
#############################

func _draw():
	var au = get_pos().y / 3 # px
	var radius = stellar_radius * au / AU # px
	var color = Color(1.0, 1.0, 1.0) # white
	draw_circle(Vector2(0.0, 0.0), 20 * radius, Color(1.0, 1.0, 1.0))
