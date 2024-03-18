extends Node2D

signal laser_hit

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("laser_hit", _on_laser_hit, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_laser_hit():
	print("enemy node + LASER HIT!")
