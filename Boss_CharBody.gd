extends CharacterBody2D


const SPEED =100.0
const JUMP_VELOCITY = -400.0
var path = null
var path_follow = null
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var parent_boss = null

func _ready():
	parent_boss = get_parent()
	path = $Path2D
	path_follow = $Path2D/PathFollow2D
	path_follow.progress = 0.0

func _process(delta):
	#$AnimatedSprite2D.play("enemy_move")
	if parent_boss.boss_hp > 0:
		path_follow.progress += SPEED * delta
		position.x = path_follow.position.x



func _on_area_2d_body_entered(body):
	print("BOSS HIT BY: " + body.name)


func _on_player_body_boss_hit():
	print("boss hit by laser")
	get_parent().boss_hp -= 1
