extends Label

func _on_sun_enter_tree():
	var pos_sun = get_node("../Sun").get_pos()

func _ready():
	var pos_sun = get_node("../Sun").get_pos()
	var pos_earth = get_node("../Earth").get_pos()
	var angle = get_node("../Sun").get_angle_to(Vector2(pos_earth))
	print(angle)
	set_process(true)

func _process(delta):
	var pos_sun = get_node("../Sun").get_pos()
	var pos_earth = get_node("../Earth").get_pos()
	var angle = get_node("../Sun").get_angle_to(Vector2(pos_earth))
	set_text("angle " + str(angle) + " pos_sun " + str(pos_sun) + " pos_earth " + str(pos_earth))
	

func _on_Sun_enter_tree():
	pass # replace with function body
