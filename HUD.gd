extends Node2D

# Number of hearts representing boss health
var maxHearts = 3

# Reference to heart TextureRect nodes
var hearts = []

func _ready():
	# Create heart nodes and add them to the HUD
	for i in range(maxHearts):
		var heart = Sprite2D.new()
		heart.texture = load("res://Assets/Player/enemy_heart.png")  # Replace with your heart texture
		if heart:
			print("HEART LOADED")
		if heart.texture == null:
			print("Heart texture not loaded!")
		else:
			print("heart texture loaded")
		heart.position.x -= 16 * maxHearts
		heart.position = Vector2(20 * i - 16 * maxHearts, 0)  # Adjust the position
		hearts.append(heart)
		add_child(heart)

func removeHeart():
	print("REMOVE HEART")
	if hearts != null and hearts.size() > 0:
		var removed_heart = hearts.pop_back()
		removed_heart.queue_free()
	
func _process(delta):
	pass
	#for i in range(maxHearts):
		#print("HEART POS: " + str(hearts[i].position.x) + "," + str(hearts[i].position.y))

func _on_area_2d_body_entered(body):
	if body.name == "CharacterBody2D_boss":
		removeHeart()
