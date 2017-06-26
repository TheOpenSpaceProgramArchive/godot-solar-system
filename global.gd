extends Node

# Gravitational constant.
const G = 6.67408e-11 # (m^3 kg^-1 s^-2)

# Astronomical unit.
const AU = 1.49598e11 # (m)

# Solar mass.
const SOLAR_MASS = 1.99e30 # (kg)

# To be used later for generated stars.
# Mass range of typical G-type main-sequence stars.
# 0.84 Mo <-----------> 1.15 Mo
const STELLAR_MASS = 0.94 * SOLAR_MASS # (kg)

# Sun's mass.
const MASS_SUN = SOLAR_MASS  # (kg)

# Viewport astronomical unit.
#
# float
#
func au():
	return get_viewport().get_rect().size.height / 4 # (px)

# Viewport center.
#
# Vector2
#
func get_viewport_center():
	return Vector2(get_viewport().get_rect().size.width/2, get_viewport().get_rect().size.height/2)
