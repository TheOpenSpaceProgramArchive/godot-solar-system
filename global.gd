extends Node

var currentScene = null

var PlayerName = "Mike"

func getPlayerName():
	return PlayerName
	
# This is recommended to be (.get_children - 1)
# But I will leave it like this until I know why.
func get_first_root_child():
	get_tree().get_root().get_children()

func _ready():
	var sun = 'fuck'
	print(sun)
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)
	Globals.set("MAX_POWER_LEVEL", 9000)

func setScene(scene):
	currentScene.queue_free()
	var s = ResourceLoader.load(scene)
	currentScene = s.instance()
	get_tree().get_root().add_child(currentScene)
