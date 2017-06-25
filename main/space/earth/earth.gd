extends Sprite

# Mass of the Earth in (kg).
var mass = 5.972e24

# Distance of the Earth to the the Sun in (px).
# radius (x - y)

# Find the Sun's location.
func find_sun():
	return get_node("../Sun").get_pos()

func orbital_speed():
	# Find the mass of the Sun.
	var sunMass = get_node("../../Space").sunMass # kg

	# Calculate Earth's orbital velocity.
	return sqrt((global.G * sunMass) / global.AU) * 1e-3 # km/s

	# Show Earth's orbital velocity to one decimal.


# Angle of the Earth to the Sun at the dawn of time (deg).
var angle = 0

func _ready():
	# Get the Earth's orbital rotation.
	var orbital_speed = orbital_speed() * 1000 # m / s

	var radius = global.AU # m

	var time_warp = 1000

	var shit = (time_warp * orbital_speed) / radius

	print(shit)

	set_process(true)

func _process(delta):
	# Find the Sun.
	var sun_location = find_sun()
	# Find your position.
	var position = get_pos()
	# Find out how fast your moving.
	var orbital_speed = orbital_speed() * 1000
	# Fine the time warp.
	var time_warp = get_node("../../../Main/Panel/Time Warp").TIME_WARP
	# Init Angular Speed relative to the Sun.
	angle += -(delta * orbital_speed * time_warp) / global.AU


	# if (angle > 2 * PI):
	#	angle -= 2 * PI

	position.x = sun_location.x + (cos(angle) * global.au())
	position.y = sun_location.y + (sin(angle) * global.au())
	set_pos(position)
