extends Node2D

# Radius of the planet.
var radius = 1.0 # Ro

# Initialization angle.
var angle = 0

# Radius of the planet.
func radius():
	return 1000 * global.au() * radius * global.EARTH_RADIUS / global.AU # px

# Draw the planet at 500x its normal size.
func _draw():
	draw_circle(get_pos(), 500 * radius(), Color(0.0, 0.0, 1.0))

func _ready():
	set_process(true)

func _process(delta):
	# Find your position.
	var position = get_pos()
	# Find the Sun.
	var sunPosition = global.get_viewport_center()
	# Find out how fast you are moving.
	var orbitalSpeed = sqrt((global.G * global.stellarMass) / global.AU) # km/s
	# Find the time warp.
	var timeWarp = get_node("../../../Main/Panel/Time Warp").TIME_WARP
	# Process the angle.
	angle += delta * orbitalSpeed * timeWarp / global.AU
	if (angle > 2 * PI):
		angle -= 2 * PI
	# Update your position.
	position.x = sunPosition.x + (cos(angle) * global.au())
	position.y = sunPosition.y - (sin(angle) * global.au())
	# Set the new position.
	set_pos(position)
