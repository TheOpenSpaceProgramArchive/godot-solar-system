extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _draw():
	draw_circle(Vector2(0.0, 0.0), 30, Color(1.0, 1.0, 1.0))

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_pos(Vector2(300, 300))