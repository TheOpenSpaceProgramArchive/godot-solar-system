extends Label

var accum=0

func _ready():
	set_text("Orbital Speed (m/s) : " + str(sqrt((get_parent().G * get_node("../Sun").mass) / get_parent().AU)))