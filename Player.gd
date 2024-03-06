extends Node2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_dying = false
var is_dead = false
var move_camera = false

func _ready(): 
	pass


func get_is_dead():
	return is_dead


func _on_area_2d_body_entered(body):
	if body.name == "CharacterBody2D":
		var charBody = get_child(0, false)
		charBody.is_dead = true
		is_dead = true
		print("IS DEAD")# Replace with function body.
