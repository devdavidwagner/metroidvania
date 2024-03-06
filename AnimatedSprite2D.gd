extends AnimatedSprite2D

var is_dead = false
var is_jumping = false
var death_ani_played = false
var jump_ani_played = false
var last_direction = "right"

# Called when the node enters the scene tree for the first time.
func _ready():
	play("right")
	stop()
	frame = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	is_dead = get_parent().get_is_dead()
	is_jumping = get_parent().get_is_jumping()
	if not is_dead and not is_jumping:
		if Input.is_action_pressed("right"):
			play("right")
			last_direction = "right"
		elif Input.is_action_pressed("left"):
			play("left")
			last_direction = "left"
		else:
			stop()
	elif not is_dead and is_jumping:
		print("JUMPING")
		if not jump_ani_played and last_direction == "right":
			play("jump_right")
			jump_ani_played = true
		elif not jump_ani_played:
			play("jump_left")
			jump_ani_played = true
		print(str(frame))
			
		if jump_ani_played and frame > 2:
			stop()
			frame = 3
			get_parent().set_is_jumping(false)
			jump_ani_played = false
			
		
	else:
		print(death_ani_played)
		if not death_ani_played:
			death_ani_played = true
			play("death")
		if death_ani_played and frame > 5:
			play("death")
			stop()
			frame = 6
			
	
	
