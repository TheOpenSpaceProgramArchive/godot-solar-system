extends Node2D

# Time warp.
const TIME_WARP = 3153600 # 10s = 365days

# Gravitational constant.
# https://en.wikipedia.org/wiki/Gravitational_constant
const G = 6.67408e-11 # m^3 / kg^1 / s^2

# Astronomical unit.
# https://en.wikipedia.org/wiki/Astronomical_unit
const AU = 1.495987e11 # m

# Solar Mass.
# https://en.wikipedia.org/wiki/Solar_mass
const SOLAR_MASS = 1.99e30 # kg

# Stellar mass.
# https://en.wikipedia.org/wiki/Stellar_mass
# Stellar mass range of typical G-type main-sequence stars:
# 0.84 M(*) <-----------> 1.15 M(*)
var stellar_mass = 1.0 # M(*)

# Standard gravitational parameter.
# https://en.wikipedia.org/wiki/Standard_gravitational_parameter
var u = G * SOLAR_MASS * stellar_mass # m^3 / s^2

# Surface gravity.
# https://en.wikipedia.org/wiki/Surface_gravity
# Surface gravity range of typical G-type main-sequence stars.
# log g = 4.48 <-----------> log g = 4.32
var log_g = 4.44 # cgs

# Stellar radius.
# Derived from the star's surface gravity and standard gravitational parameter.
var stellar_radius = sqrt(100 * u / pow(10, log_g)) # m

# Astronical unit in pixels. 1/8th the viewport height.
func au():
	return get_viewport().get_rect().size.height / 8 # px
