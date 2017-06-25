extends Label

func _ready():
	# Find the mass of the Sun.
	var sunMass = get_node("../../../Instrument").get_sun_node().mass
	
	# Calculate Earth's orbital velocity.
	var v = sqrt((global.G * sunMass) / global.AU) * 1e-3 # km/s
	
	set_text("Orbital Speed : " + str("%.1f" % v) + " km/s")
