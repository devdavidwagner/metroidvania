extends AnimatedSprite2D

var is_dead = false
var death_ani_played = false

# Called when the node enters the scene tree for the first time.
func _ready():
	play("right")
	stop()
	frame = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	is_dead = get_parent().get_is_dead()
	
	if not is_dead:
		if Input.is_action_pressed("right"):
			play("right")
		elif Input.is_action_pressed("left"):
			play("left")
		else:
			stop()
	else:
		print(death_ani_played)
		if not death_ani_played:
			death_ani_played = true
			play("death")
		if death_ani_played and frame > 5:
			play("death")
			stop()
			frame = 6
			
	
	
