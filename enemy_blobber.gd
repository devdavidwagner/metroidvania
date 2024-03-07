extends Node2D


const SPEED = 5.0
const JUMP_VELOCITY = -400.0
signal player_hit

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var path = null
var path_follow = null
var speed = 100

func _ready():
	path = $Path2D
	path_follow = $Path2D/PathFollow2D
	path_follow.progress = 0.0

func _process(delta):
	path_follow.progress -= speed * delta
	position.x = path_follow.position.x
	position.x -= 256
			
func _physics_process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "PlayerBody":
		print(body.name)
		emit_signal("player_hit")
