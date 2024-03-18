extends Node2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_dying = false
var is_dead = false
var move_camera = false
var last_direction = false

func _ready(): 
	connect("laser_hit", _on_laser_hit, 0)
	
func _process(delta):
	pass

func get_is_dead():
	return is_dead

func _on_area_2d_body_entered(body):
	print("BODY: " + body.name)
	if body.name == "EnemyBody":
		#is_dead = true
		pass
	if body.name == "PlayerBody":
		var charBody = get_child(0, false)
		charBody.is_dead = true
		#is_dead = true
		
func _on_laser_hit():
	print("FOUND LASER HIT??!")
