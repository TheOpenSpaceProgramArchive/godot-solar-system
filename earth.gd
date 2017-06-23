extends Sprite

# Mass of the Earth in (kg).
var mass = 5.972e24

# Distance of the Earth to the the Sun in (px).
func radius():
	return get_parent().astro_unit

# Angle of the Earth to the Sun at the dawn of time (deg).
var angle = 0

func _ready():
	set_process(true)

func _process(delta):
	var sun_location = get_node("../Sun").get_pos()
	var position = get_pos()
	angle += -delta * (PI / 180) * 100
	if (angle > 360):
		angle -= 360
	position.x = sun_location.x + (cos(angle) * radius())
	position.y = sun_location.y + (sin(angle) * radius())
	set_pos(position)