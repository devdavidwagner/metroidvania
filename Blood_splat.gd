extends AnimatedSprite2D

var is_dead = false
var bloodSplat_played = false
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	is_dead = get_parent().get_is_dead()
	
	if is_dead:
		show()
		bloodSplat_played = true
		play("blood_splat")
		
	if bloodSplat_played and frame > 6:
		stop()
		frame = 7
