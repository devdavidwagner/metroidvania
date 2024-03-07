extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_dying = false
var is_dead = false
var move_camera = false
var is_jumping = false
var is_attacking = false
var direction = "right"

func get_direction():
	return direction
	
func get_is_dead():
	return is_dead

func get_is_jumping():
	return is_jumping
	
func get_is_attacking():
	return is_attacking

func set_is_attacking(attack):
	is_attacking = attack
	
func set_is_jumping(jump):
	is_jumping = jump
	
func _ready():
	# Access the desired node within the loaded scene
	var group = get_tree().get_nodes_in_group("Enemy")
	if not group:
		print("NOT GROUPED")
	var node = group[1]
	print(node.name)
	node.connect("player_hit",_on_enemy_player_hit, 0)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if not is_dead:
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			is_jumping = true
		direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		if Input.is_action_just_pressed("left_click"):
			is_attacking = true
	else:
		velocity.x = 0
					
	move_and_slide()

func _on_enemy_player_hit():
	is_dead = true
	print("ENEMY HIT")

func _on_end_screen_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	move_camera = true
