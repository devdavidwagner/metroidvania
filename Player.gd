extends RigidBody2D
const SPEED = 100 # Adjust the speed as needed

var velocity = Vector2()
var gravity = 50
var screen_size = get_viewport_rect().size # Get the size of the viewport (screen)


# Called when the node enters the scene tree for the first tiget chilme.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
	
	print(velocity.x)
	apply_central_force(velocity)
	
	if Input.is_action_just_pressed("exit_game"):
		get_tree().quit()
		
	var collision = move_and_collide(velocity)
	print(collision)
	if collision:
		print("DEATH")

	
func positionHandling(position):
	var new_position = position

	# Check if the sprite is moving off the left or right side of the screen
	if new_position.x < 0:
		new_position.x = 0
	elif new_position.x > screen_size.x:
		new_position.x = screen_size.x

	# Check if the sprite is moving off the top or bottom side of the screen
	if new_position.y < 0:
		new_position.y = 0
	elif new_position.y > screen_size.y:
		new_position.y = screen_size.y

	return new_position


func _on_area_2d_body_entered(body):
	position.y = body.position.y
	print("COLLIDING")
