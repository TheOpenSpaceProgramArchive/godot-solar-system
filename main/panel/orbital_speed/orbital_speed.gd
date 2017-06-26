# Orbital Speed is equal to sqrt(G * M / r)

extends Label

func _ready():
	var s = sqrt((global.G * global.MASS_SUN) / global.AU) * 1e-3 # km/s
	set_text("Orbital Speed : " + str("%.1f" % s) + " km/s")
