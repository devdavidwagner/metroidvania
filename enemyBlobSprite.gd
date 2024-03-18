extends AnimatedSprite2D

var node = null
var death_ani_played = false
# Called when the node enters the scene tree for the first time.
func _ready():
	var group = get_parent()
	if not group:
		print("NOT GROUPED")
	else:
		node = group
	print("NODE: " + node.name)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if node.get_is_dead():
		death_ani_played = true
	else:
		play("enemy_moving")
	
	if node.get_is_dead() and death_ani_played:
		play("enemy_dead")
		
		if frame > 3:
			death_ani_played = false
			frame = 4
