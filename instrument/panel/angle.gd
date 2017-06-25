extends Label

# All this shit needs to be rewritten. How is it possible to
# not call all of these stupid functions during the process?

func find_sun():
	return get_node("../../Space/Sun")

func find_earth():
	return get_node("../../Space/Earth")

func sun_pos():
	return global.get_viewport_center()

func earth_pos():
	return get_node("../../../Instrument").get_earth_node().get_pos()

func sun_rot():
	return find_sun().get_rot()

func sun_look():
	return Vector2(cos(sun_rot()), sin(sun_rot()))

func sun_look_to_earth():
	return Vector2(earth_pos() - sun_pos())

func sun_look_magnitude():
	return sun_look().length()

func sun_look_to_earth_magnitude():
	return sun_look_to_earth().length()

func _ready():

	set_process(true)

func _process(delta):
	# janky
	var numerator = sun_look().dot(sun_look_to_earth())
	# ass
	var denominator = sun_look_magnitude() * sun_look_to_earth_magnitude()
	# shit
	var angle = acos(numerator / denominator) * (180 / PI)
	if (sun_look_to_earth().y > 0):
		angle = (180 - angle) + 180

	set_text("Angle : " + str("%.f" % angle) + " deg")
