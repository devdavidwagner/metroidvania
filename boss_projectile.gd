extends Node2D
var projectile_speed = 30.0
var rigidbody = null
var velocity_x = 1.5
var velocity_y = 1.5
var throw_projectiles_enabled = false
var screen_size_x = 256
var screen_size_y = 240
var despawn_margin = 5 # Adjust this value as needed
var direction = "up_right"
var parent = null

signal projectile_boss

var emit = false

func set_emit(emit_enable):
	emit = emit_enable

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()

func _process(delta):
	var direction_index = randi() % 2
	if direction_index == 0:
		direction = "up_right" 
	else:
		direction = "up_left"
	if throw_projectiles_enabled:
		if direction == "up_right":
			position.x += velocity_x
			position.y -= velocity_y
		if direction == "up_left":
			position.x -= velocity_x
			position.y -= velocity_y
	
		

func throw_projectiles():
	throw_projectiles_enabled = true

func _on_area_2d_body_entered(body):
	if body.name == "PlayerBody":
		print("PROJECTILE HIT")
		emit = true
