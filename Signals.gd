extends Node2D
signal next_scene

# Create a singleton instance
func _ready():
	if not Engine.has_singleton("Signals"):
		Engine.register_singleton("Signals", self)
	print("Signals running")

# Static method to access the singleton
static func get_singleton():
	return Engine.get_singleton("Signals")
