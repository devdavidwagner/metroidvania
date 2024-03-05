extends Camera2D

var move_threshold = 100  # Threshold distance from screen edge to trigger camera movement
var move_amount = 256     # Amount to move the camera if the player is past the screen edge
var player_position = Vector2()
var player
var viewport_size 

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../CharacterBody2D")
	viewport_size = get_viewport_rect().size
		
var camera_speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
 # Get the position of the player
	if player:
		if player.move_camera:
			global_position.x += move_amount
			player.move_camera = false

	# Get the position of the camera relative to the player
	



