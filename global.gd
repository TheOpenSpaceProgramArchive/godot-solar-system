extends Node

var currentScene = null

var PlayerName = "Mike"

func getPlayerName():
	return PlayerName

func _ready():
	var sun = get_tree()
	print(sun)
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)
	Globals.set("MAX_POWER_LEVEL", 9000)

func setScene(scene):
	currentScene.queue_free()
	var s = ResourceLoader.load(scene)
	currentScene = s.instance()
	get_tree().get_root().add_child(currentScene)
