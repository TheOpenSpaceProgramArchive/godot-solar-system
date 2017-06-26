extends Sprite

# Angle of the Earth to Sun to axis.
var angle = 0

func _ready():
	set_process(true)

func _process(delta):
	# Find the Sun.
	var sun_location = get_node("../Sun").get_pos()
	# Find your position.
	var position = get_pos()
	# Find out how fast your moving.
	var orbital_speed = sqrt((global.G * global.MASS_SUN) / global.AU)
	# Fine the time warp.
	var time_warp = get_node("../../../Main/Panel/Time Warp").TIME_WARP
	# Do the stuff
	angle += -(delta * orbital_speed * time_warp) / global.AU


	# if (angle > 2 * PI):
	#	angle -= 2 * PI

	position.x = sun_location.x + (cos(angle) * global.au())
	position.y = sun_location.y + (sin(angle) * global.au())
	set_pos(position)
