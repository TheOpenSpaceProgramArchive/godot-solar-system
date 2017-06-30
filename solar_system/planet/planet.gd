extends Control

const TIME_WARP = 3153600 # 10s = 365days

var mass = 1.0 # M(+)
var semimajor_axis = 149.60e6 # km
var eccentricity = 0.0
var orbital_speed = 2

func initialize(m, a, e, s):
	var mass = m

func _ready():
	set_process(true)
	print(orbital_speed)

var theta = 0
func _process(delta):
	var au = get_parent().get_global_pos().y / 3
	var pos = get_pos()
	# Process the angle.
	theta += TIME_WARP * delta * orbital_speed / 1000 / semimajor_axis
	if (theta > 2 * PI):
		theta -= 2 * PI
	# Update your position.
	pos.x = cos(theta) * au
	pos.y = sin(theta) * au
	print(pos)
	# Set the new position.
	set_pos(pos)

func _draw():
	var color = Color(1.0, 1.0, 1.0)
	draw_circle(get_pos(), 20, color)