extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass	


func _process(delta):
	if Input.is_action_just_pressed("toggle_fullscreen"):    # Toggle fullscreen mode
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif Input.is_action_just_pressed("exit_game"):  
		get_tree().quit()
	elif Input.is_action_just_pressed("reload"):  
		get_tree().reload_current_scene()





