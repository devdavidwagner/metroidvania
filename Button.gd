extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var signals = Engine.get_singleton("Signals")
	signals.emit_signal("next_scene")
	print("NEXT SCENE")


