extends Sprite

# Angle of the Earth to Sun to axis.
var angle = 0

func _ready():
	set_process(true)

func _process(delta):
	# Find the Sun.
	var sunPosition = global.get_viewport_center()
	# Find your position.
	var position = get_pos()
	# Find out how fast your moving.
	var orbitalSpeed = sqrt((global.G * global.MASS_SUN) / global.AU)
	# Fine the time warp.
	var timeWarp = get_node("../../../Main/Panel/Time Warp").TIME_WARP
	# Do the stuff
	angle += -(delta * orbitalSpeed * timeWarp) / global.AU


	# if (angle > 2 * PI):
	#	angle -= 2 * PI

	position.x = sunPosition.x + (cos(angle) * global.au())
	position.y = sunPosition.y + (sin(angle) * global.au())
	set_pos(position)
