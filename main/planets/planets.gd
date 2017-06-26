extends Node2D

# Draw scale multiplier of the planets.
const DRAW_SCALE = 700

# Initialization angle of the planets.
var theta = 0

# Radius of the planets.
func radius(r):
	return 1000 * global.au() * r * global.EARTH_RADIUS / global.AU # px

# Semi major axis of the planets
func semi_major_axis(semiMajorAxisRatio):
    return semiMajorAxisRatio * global.AU # m

# Orbital speed of the planets.
func orbital_speed(semiMajorAxis):
    return sqrt((global.G * global.stellarMass) / semiMajorAxis) # m/s

# Time warp.
func time_warp():
    return get_node("../../../Main/Panel/Time Warp").TIME_WARP

func _ready():
    set_process(true)
