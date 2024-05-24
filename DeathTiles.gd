extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	print("DEATH TILE :" + body.name)
	if body.name == "DeathTiles":
		var player = get_node("../Player").get_child(0)
		player._on_enemy_player_hit()
