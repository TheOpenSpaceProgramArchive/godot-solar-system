extends Control

# Gravitational constant. https://en.wikipedia.org/wiki/Gravitational_constant
const G = 6.67408e-11 # m^3 / kg^1 / s^2

# Astronomical unit.
const AU = 1.495987e11 # m
	
# Solar Mass. https://en.wikipedia.org/wiki/Solar_mass
const SOLAR_MASS = 1.99e30 # kg

# Stellar mass. https://en.wikipedia.org/wiki/Stellar_mass
# Stellar mass range of typical G-type main-sequence stars:
# 0.84 Mo <-----------> 1.15 Mo
export var stellar_mass = 1.0 # Mo

# Standard gravitational parameter. https://en.wikipedia.org/wiki/Standard_gravitational_parameter
var u = G * SOLAR_MASS * stellar_mass # m^3 / s^2

# Surface gravity. https://en.wikipedia.org/wiki/Surface_gravity
# Surface gravity range of typical G-type main-sequence stars.
# log g = 4.48 <-----------> log g = 4.32
export var log_g = 4.44 # cgs

# Solar radius. https://en.wikipedia.org/wiki/Solar_radius
var solar_radius = sqrt(100 * u / pow(10, log_g)) # m

# Solar radius. https://en.wikipedia.org/wiki/Solar_radius
const SOLAR_RADIUS = 6.957e5 # km

# === 27.94 m / s^2
var g = pow(10, log_g) / 100

func _ready():
	# I don't think these are floats?
	var au = get_pos().y / 3
	print(au)

func au():
	return sqrt(100)




const SOLAR_RADIUS = 6.957e5 # km
#func _init():
	#connect("center", self, "_set_sun_pos")
#
#func _ready():
	#connect("center", self, "_set_sun_pos")
	# Called every time the node is added to the scene.
	# Initialization here
	#set_pos(Vector2(300, 300))
func _draw():
	
	var au = get_pos().y / 3
	var radius = au * solar_radius / AU
	print(radius)
	
	#var star_radius = au * sqrt(100 * G * stellarMass / pow(10, SURFACE_GRAVITY)) / AU # px
	draw_circle(Vector2(0.0, 0.0), 20 * radius, Color(1.0, 1.0, 1.0))