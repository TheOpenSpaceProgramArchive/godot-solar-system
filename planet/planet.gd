tool
extends Node2D

# Gravitational constant. https://en.wikipedia.org/wiki/Gravitational_constant
const G = 6.67408e-11 # m^3 / kg^1 / s^2

const TIME_WARP = 3153600 # 10s = 365days

export var u = 1

export var au = 1

export var semimajor_axis = 0

export var orbital_speed = 0


signal shit

#var mass = 1.0 # M(+)
#var semimajor_axis = 149.60e6 # km
#var eccentricity = 0.0
#var orbital_speed = 2
#var au = 0
#func initialize(m, a, e, s):
#	var mass = m
func _stellar_mass():
	print("fuck")

func orbital_speed():
	return sqrt(get_parent())

func _ready():
	connect("stellar_mass", self, "_stellar_mass")
	if get_parent().stellar_mass != null:
		var fuck = 3
		print(fuck)
	else:
		print("shit")
	print(get_pos())
	set_process(true)
	emit_signal("shit")
	#print(orbital_speed)

var theta = 0
func _process(delta):
	emit_signal("shit")
	var pos = get_pos()
	#print(semimajor_axis)

	# Process the angle.
	theta -= TIME_WARP * delta * orbital_speed / semimajor_axis
	if (abs(theta) > 2 * PI):
		theta += 2 * PI
	# Update your position.
	pos = au * Vector2(cos(theta), sin(theta))
	# Set the new position.
	set_pos(pos)

func _draw():
	var color = Color(1.0, 0.0, 0.0)
	draw_circle(get_pos(), 6, color)
