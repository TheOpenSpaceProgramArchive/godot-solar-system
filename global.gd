extends Node

# Gravitational constant.
const G = 6.67408e-11 # (m^3 kg^-1 s^-2)

# Astronomical unit.
const AU = 1.49598e11 # (m)

# Convert Astronimal unit to pixels.
# One AU is equal to 1/4 of the viewport height.
func au():
	return get_viewport().get_rect().size.height / 4 # (px)

# Find the center of the viewport.
# The location of the Sun.
func get_viewport_center():
	return Vector2(get_viewport().get_rect().size.width/2, get_viewport().get_rect().size.height/2)
