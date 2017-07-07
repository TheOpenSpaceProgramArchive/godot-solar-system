extends "res://solar_system/universe.gd"

func _ready():
	set_pos(Vector2(get_viewport().get_rect().size.width / 2, 3 * au())) # px
	print(get_pos())
