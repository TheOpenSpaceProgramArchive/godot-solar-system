extends Sprite

# Mass of the Earth in (kg).
var mass = 5.972e24

# Distance of the Earth to the the Sun in (px).
# radius (x - y)
func radius():
	return get_parent().astro_unit

# Find the Sun's location.
func find_sun():
	return get_node("../Sun").get_pos()

# Angle of the Earth to the Sun at the dawn of time (deg).
var angle = 0

func _ready():
	set_process(true)

func _process(delta):
	# Find the Sun.
	var sun_location = find_sun()
	# Find your position.
	var position = get_pos()
	# Init Angular Speed relative to the Sun.
	angle += -delta * (PI / 180) * 5
	if (angle > 360):
		angle -= 360

	position.x = sun_location.x + (cos(angle) * radius())
	position.y = sun_location.y + (sin(angle) * radius())
	set_pos(position)
