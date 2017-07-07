extends "res://solar_system/universe.gd"

# Distance from the solar system nucleus.
var semimajor_axis = 1.0 # AU

# Color of the planet.
var color = Color(0.0, 0.0, 1.0) # rgba

# Initialization angle.
var theta = 0 # rad

func _ready():
	set_process(true)

func _process(delta):
	var pos = get_pos()
	var radius = semimajor_axis * AU
	theta -= TIME_WARP * delta * sqrt(u / pow(radius, 3))
	if (abs(theta) > 2 * PI):
		theta += 2 * PI
	pos = au() * radius * Vector2(cos(theta), sin(theta)) / AU
	set_pos(pos)

func _draw():
	draw_circle(get_pos(), 6, color)
