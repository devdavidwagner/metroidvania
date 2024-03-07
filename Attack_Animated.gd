extends AnimatedSprite2D

var is_attacking = false
var effect_played = false
var direction = 0
var lastDir = "right"
var moved_sprite = false
var prev_pos = Vector2()

signal enemy_hit
# Called when the node enters the scene tree for the first time.
func _ready():
	var collision_area = Area2D.new()
	collision_area.position = position
	add_child(collision_area)
	collision_area.connect("enemy_hit",_on_enemy_hit, 0)
	hide()
	
		
func _on_enemy_hit(body):
	print("ATTACK " + body.name)
	emit_signal("enemy_hit")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	is_attacking = get_parent().get_is_attacking()
	direction = get_parent().get_direction()
	if is_attacking and lastDir == "right":
		show()
		play("attack_effect")
		effect_played = true 
	elif is_attacking and lastDir == "left":
		if not moved_sprite:
			prev_pos = position
			position.x -= 32
			moved_sprite = true
		show()
		play("attack_effect")
		effect_played = true 
	if effect_played and frame > 5:
		stop()
		hide()
		if moved_sprite:
			position = prev_pos
			moved_sprite = false
	if direction == 1:
		lastDir = "right"
	elif direction == -1:
		lastDir = "left"
