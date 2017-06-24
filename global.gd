extends Node



var currentScene = null

var PlayerName = "Mike"

func getPlayerName():
	return PlayerName

# This is recommended to be (.get_children - 1)
# But I will leave it like this until I know why.
func get_first_root_child():
	get_tree().get_root().get_children()
	
func get_viewport_center():
	return Vector2(get_viewport().get_rect().size.width/2, get_viewport().get_rect().size.height/2)

func _ready():
	var center = Vector2(get_viewport().get_rect().size.width/2, get_viewport().get_rect().size.height/2)
	var sun = get_viewport()
	print(sun)
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)
	Globals.set("MAX_POWER_LEVEL", 9000)
	global.set("CENTER", center)

func setScene(scene):
	currentScene.queue_free()
	var s = ResourceLoader.load(scene)
	currentScene = s.instance()
	get_tree().get_root().add_child(currentScene)
