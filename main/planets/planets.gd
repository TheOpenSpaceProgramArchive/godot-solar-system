extends Node2D

# Draw scale multiplier of the planets.
const DRAW_SCALE = 700

# Initialization angle of the planets.
var theta = 0

# Radius of the planets.
func radius(r):
	return 1000 * global.au() * r * global.EARTH_RADIUS / global.AU # px

# Semi major axis of the planets
func semi_major_axis(semiMajorAxisRatio):
    return semiMajorAxisRatio * global.AU # m

# Orbital speed of the planets.
func orbital_speed(semiMajorAxis):
    return sqrt((global.G * global.stellarMass) / semiMajorAxis) # m/s

# Time warp.
func time_warp():
    return get_node("../../../Main/Panel/Time Warp").TIME_WARP

func _ready():
	set_process(true)
	#add_child(node)

#class CustomObject : public Object {
#	OBJ_TYPE(CustomObject,Object); // this is required to inherit
#};

#obj = memnew(CustomObject);
#print_line("Object Type: ",obj->get_type()); //print object type
#obj2 = obj->cast_to<OtherType>(); // converting between types, this also works without RTTI enabled.

#class Planet:
	#var a = 10


#var node=Planet.new()



#obj->connect(<signal>,target_instance,target_method)
#obj->connect("yeezy_season_approaching",self,"_some_callback")
