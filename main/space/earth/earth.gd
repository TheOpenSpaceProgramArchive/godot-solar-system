extends Sprite

# Angle of the Earth to Sun to axis.
var angle = 0

var radius = 1.0 # Ro

func radius():
	return 1000 * global.au() * radius * global.EARTH_RADIUS / global.AU # px

func _draw():
	draw_circle(get_pos(), 500 * radius(), Color(0.0, 0.0, 1.0))

func _ready():
	print(radius() * global.AU / global.au())
	set_process(true)

func _process(delta):
	# Find the Sun.
	var sunPosition = global.get_viewport_center()
	# Find your position.
	var position = get_pos()
	# Find out how fast you are moving.
	var orbitalSpeed = sqrt((global.G * global.stellarMass) / global.AU)
	# Find the time warp.
	var timeWarp = get_node("../../../Main/Panel/Time Warp").TIME_WARP
	# Do the stuff.
	angle += -(delta * orbitalSpeed * timeWarp) / global.AU


	# if (angle > 2 * PI):
	#	angle -= 2 * PI

	position.x = sunPosition.x + (cos(angle) * global.au())
	position.y = sunPosition.y + (sin(angle) * global.au())
	set_pos(position)
