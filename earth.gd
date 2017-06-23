extends Sprite

# Mass of the Earth in (kg).
var mass = 5.972 * pow( 10, 24 )

# Distance of the Earth to the the Sun in (px).
func radius():
	return get_parent().astro_unit

var angle = 0

func _ready():
	# Move the Planet one AU from the Sun.
	var initial_position = Vector2(get_node("../Sun").get_pos().x + (cos(0) * radius()), 0)
	set_pos(initial_position)
	
	set_process(true)

func _process(delta):
	var position = get_pos()
	angle += delta * (PI / 180) * 100
	position.x = get_node("../Sun").get_pos().x + (cos(angle) * radius())
	position.y = get_node("../Sun").get_pos().y + (sin(angle) * radius())
	set_pos(position)