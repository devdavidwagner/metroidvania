extends AnimatedSprite2D
var ani_played = false
var death_ani_played = false
var boss = null
var lastHP = 3
var charBody = null
# Called when the node enters the scene tree for the first time.
func _ready():
	charBody = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if charBody.play_blood_ani:
		play("blood_boss")
		print("PLAY BLOOD")
	
	

