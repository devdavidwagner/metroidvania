extends Node2D

var projectile_scene = preload("res://boss_projectile.tscn")
var timer = Timer.new()
signal timeout
signal player_hit_boss
var projectile_speed = 30.0
var rigidbody = null
var velocity_x = 1
var velocity_y = 1
var projectile = null
var boss = null
signal projectile_hit
var boss_hp = 3


# Define angles for the spray pattern
var angles = [0, 45, 90, 135, 180, 225, 270, 315]

func _ready():
	# Start firing projectiles
	projectile = projectile_scene.instantiate()
	rigidbody = projectile.get_child(0)
	add_child(projectile)	
	var timer = Timer.new()
	timer.wait_time = 1.0
	projectile.hide()
	timer.connect("timeout", _on_Timer_timeout)
	add_child(timer)	
	timer.start()
	boss = get_child(0)
	
func _process(delta):
	if projectile.emit:
		emit_signal("projectile_hit")
		projectile.set_emit(false)
		
	#print("BOSS HP: " + str(boss_hp))

func _on_Timer_timeout():
	if boss_hp > 0:
		projectile.position = boss.position
		projectile.show()
		projectile.throw_projectiles()


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "PlayerBody":
		emit_signal("player_hit_boss")
