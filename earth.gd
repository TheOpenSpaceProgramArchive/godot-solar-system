extends Sprite

# Mass of the Earth in (kg).
var mass = 5.972e24

# Distance of the Earth to the the Sun in (px).
func radius():
	return get_parent().astro_unit

# Find the Sun's position in space.
func find_sun():
	return get_node("../Sun").get_pos()

# Angle of the Earth to the Sun at the dawn of time (deg).
var angle = 0

func _ready():
	set_process(true)

func _process(delta):
	var position = get_pos()
	angle += -delta * (PI / 180) * 100
	if (angle > 360):
		angle -= 360
	position.x = find_sun().x + (cos(angle) * radius())
	position.y = find_sun().y + (sin(angle) * radius())
	set_pos(position)