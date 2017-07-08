extends Node2D

# Time warp.
const TIME_WARP = 3153600 # 10s = 365days

# Distance from the sun.
export var semimajor_axis = 1.0 # AU

# Color of the planet.
export var color = Color(0.0, 0.0, 1.0) # rgba

# Initialization angle.
export var theta = 0 # rad

func _draw():
	# Draw the planet.
	draw_circle(get_pos(), 6, color)

func _ready():
	set_process(true)

func _process(delta):
	# Astronomical unit.
	var AU = get_parent().AU # m
	# Standard gravitational parameter of the sun.
	var u = get_parent().u # m^3 / s^2
	# Astronomical unit in pixels.
	var au = get_parent().au() # px
	# Distance from the sun.
	var radius = semimajor_axis * AU # m
	# If I was better at GDScript, the above variables could be taken
	# out of the _process(delta) function.
	#
	# Position of the planet.
	var pos = get_pos() # px
	# Orbital angle
	theta -= TIME_WARP * delta * sqrt(u / pow(radius, 3)) # rad
	# Revert orbital angle back after 2 * PI
	if (abs(theta) > 2 * PI):
		theta += 2 * PI
	# Find the planet's new position.
	pos = au * radius * Vector2(cos(theta), sin(theta)) / AU
	# Set the new position.
	set_pos(pos)
