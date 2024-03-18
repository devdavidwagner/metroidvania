extends Camera2D

var move_threshold = 100  # Threshold distance from screen edge to trigger camera movement
var move_amount = 256     # Amount to move the camera if the player is past the screen edge
var move_down_amount = 240
var player_position = Vector2()
var player
var viewport_size 
var last_direction = "right"

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../CharacterBody2D")
	viewport_size = get_viewport_rect().size
	position = Vector2(512,224) # boss pos
		
var camera_speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
 # Get the position of the player
	var direction = Input.get_axis("left", "right")
	
	if direction > 0:
		last_direction = "right"
	else:
		last_direction = "left"
	
	
	# Get the position of the camera relative to the player


func _on_end_screen_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if local_shape_index == 2:
		global_position.y += move_down_amount
	else:
		if last_direction == "right":
			global_position.x += move_amount
		elif last_direction == "left":
			global_position.x -= move_amount
