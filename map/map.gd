extends Control
# sub-scene(s)
var solar_system = preload("res://solar_system/solar_system.tscn").instance()

# Width of the Map.
func get_viewport_width():
	return get_viewport().get_rect().size.width # px

# Astronomical unit of the Map.
func au():
	# The Map's AU will be 1/8 the Map height.
	var au = get_viewport().get_rect().size.height / 8 # px
	# I don't think these are floats?
	return au # px

# Add the sub-scene(s).
func _ready():
	var solar_system_pos = Vector2(get_viewport_width() / 2, 3 * au()) # px
	solar_system.set_pos(solar_system_pos) # px
	add_child(solar_system)

# Layout a reference axis.
func _draw():
	var from = Vector2(get_viewport_width() / 2, 3 * au()) # px
	var to = from + Vector2(3 * au(), 0.0) # px
	var color = Color(0.0, 0.0, 0.0) # black
	draw_line(from, to, color, 1.0)