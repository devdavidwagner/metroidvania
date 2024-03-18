extends AnimatedSprite2D

var is_attacking = false
var effect_played = false
var direction = 0
var lastDir = "right"
var moved_sprite = false
var prev_pos = Vector2()
var ani_played = false
var collision = null

signal enemy_hit
# Called when the node enters the scene tree for the first time.
func _ready():
	collision = get_node("Area2D/CollisionShape2D")
	hide()
			
func _on_enemy_hit(body):
	print("ATTACK " + body.name)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	is_attacking = get_parent().get_is_attacking()
	direction = get_parent().get_direction()
	
	if is_attacking:
		collision.disabled = false
	else:
		collision.disabled = true
	
	if is_attacking and lastDir == "right" and not ani_played:
		show()
		if not ani_played:
			play("attack_effect")
			ani_played= true
		effect_played = true 
	elif is_attacking and lastDir == "left" and not ani_played:
		if not moved_sprite:
			prev_pos = position
			position.x -= 32
			moved_sprite = true
		show()
		if not ani_played:
			play("attack_effect")
			ani_played= true
		effect_played = true 
	if effect_played and frame > 5:
		stop()
		hide()
		ani_played = false
		if moved_sprite:
			position = prev_pos
			moved_sprite = false
	if direction == 1:
		lastDir = "right"
	elif direction == -1:
		lastDir = "left"
