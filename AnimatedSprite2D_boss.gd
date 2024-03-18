extends AnimatedSprite2D
var ani_played = false
var death_ani_played = false
var boss = null
# Called when the node enters the scene tree for the first time.
func _ready():
	show()
	boss = get_parent().get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if boss.boss_hp > 0:
		play("boss_move")
		ani_played = true
	if boss.boss_hp == 0 and not death_ani_played:
		play("boss_dying")
		death_ani_played = true
	if death_ani_played and frame > 2:
		frame = 3
		 
	
	
