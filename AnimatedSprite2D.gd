extends AnimatedSprite2D

var is_dead = false
var is_jumping = false
var is_attacking = false
var death_ani_played = false
var jump_ani_played = false
var attack_ani_played = false
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
	is_attacking = get_parent().get_is_attacking()
	
	if not is_dead and not is_jumping and not is_attacking:
		if Input.is_action_pressed("right"):
			play("right")
			last_direction = "right"
		elif Input.is_action_pressed("left"):
			play("left")
			last_direction = "left"
		else:
			stop()
	elif not is_dead and is_jumping and not is_attacking:
		if not jump_ani_played and last_direction == "right":
			play("jump_right")
			jump_ani_played = true
		elif not jump_ani_played:
			play("jump_left")
			jump_ani_played = true		
		if jump_ani_played and frame > 2:
			stop()
			frame = 3
			get_parent().set_is_jumping(false)
			jump_ani_played = false
	elif is_attacking:		
			if not attack_ani_played and  last_direction == "left":
				attack_ani_played = true
				play("attack_left")
			elif not attack_ani_played and  last_direction == "right":
				attack_ani_played = true
				play("attack_right")
			if attack_ani_played and frame > 4:
				stop()
				frame = 5
				attack_ani_played = false
				get_parent().set_is_attacking(false)
		
	else:
		if not death_ani_played:
			death_ani_played = true
			play("death")
		if death_ani_played and frame > 5:
			play("death")
			stop()
			frame = 6
			
	
	
