extends Sprite

# Mass of the Sun in (kg).
var mass = 1.989 * pow(10, 30)

func _ready():
	# Move the Sun to the center of the viewport.
	set_pos(Vector2(get_viewport().get_rect().size.width/2, get_viewport().get_rect().size.height/2))