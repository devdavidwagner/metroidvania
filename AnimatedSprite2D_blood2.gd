extends AnimatedSprite2D

var charBody = null
var played_blood = false
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	charBody = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if charBody.play_blood_ani:
		show()
		play("blood_splat")
		played_blood = true
		
	if played_blood:
		charBody.play_blood_ani = false
	
	if played_blood and frame > 2:
		played_blood = false
		stop()
		hide()
