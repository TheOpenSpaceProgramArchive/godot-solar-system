extends Label

func earth_pos():
	return get_node("../../../Main/Planets/Earth").get_pos()

func earth_look():
	return Vector2(earth_pos() - global.get_viewport_center())

func _ready():
	set_process(true)

func _process(delta):
	var angle = acos(earth_look().x / global.au()) * (180 / PI)
	if (earth_look().y > 0):
		angle = 360 - angle

	set_text("Angle : " + str("%.f" % angle) + " deg")
