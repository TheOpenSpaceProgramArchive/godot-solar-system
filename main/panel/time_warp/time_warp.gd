# Time warp is the acceleration of game speed.

extends Label

const TIME_WARP = 3153600

func _ready():
	set_text("Time Warp : " + str("%s" % TIME_WARP) + "x")