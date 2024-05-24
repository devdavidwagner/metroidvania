extends Node2D
var introScreen = null
# Called when the node enters the scene tree for the first time.
func _ready():
	# Instance a scene
	introScreen = preload("res://IntroScreen.tscn").instantiate()
	add_child(introScreen)
	if Engine.has_singleton("Signals"):
		var signals = Engine.get_singleton("Signals")
		signals.connect("next_scene",_on_next_scene)
		#signals.connect("next_scene", _on_next_scene)
		print("singleton found.")
	else:
		print("Signals singleton not found.")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_next_scene():
	print("ON NEXT SCENE")
	var scene_instance = preload("res://LevelOne.tscn").instantiate()
	add_child(scene_instance)
	introScreen.queue_free()
	scene_instance.global_position = Vector2(0, 0)
	scene_instance.position = Vector2(0, 0)
