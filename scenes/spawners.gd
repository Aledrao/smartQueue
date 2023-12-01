extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var character = preload("res://scenes/character.tscn").instantiate()
	character.position = Vector3(0, 10, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
