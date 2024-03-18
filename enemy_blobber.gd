extends Node2D


const SPEED = 5.0
const JUMP_VELOCITY = -400.0
signal player_hit
signal laser_hit

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var path = null
var path_follow = null
var speed = 100
var is_dead = false
var collision = null
var collision_mand = null

func get_is_dead():
	return is_dead

func _ready():
	path = $Path2D
	path_follow = $Path2D/PathFollow2D
	path_follow.progress = 0.0
	
	var group = get_tree().get_nodes_in_group("Player")
	if not group:
		print("NOT GROUPED")
	var node = group[1]
	print(node.name)
	node.connect("laser_hit", _on_laser_hit, 0)
	
	collision = find_child("CollisionShape2D", true)
	collision_mand = find_child("CollisionShape2D_mand", true)
	

func _process(delta):
	if not is_dead:
		path_follow.progress -= speed * delta
		position.x = path_follow.position.x
		position.x -= 256
	else:
		if collision:
			collision.disabled = true
		if collision_mand:
			collision_mand.disabled = true
	
	
			
func _physics_process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "PlayerBody":		
		emit_signal("player_hit")
		print("player hit")
		
func _on_laser_hit(id):
	print("LASER ID: " + str(id))
	if id == get_instance_id():
		is_dead = true
		print("LASER HIT!")
