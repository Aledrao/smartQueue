extends Node3D

@onready var character = $character

func _physics_process(delta: float) -> void:
	var character = preload("res://scenes/character.tscn").instantiate()
	character.position = Vector3(0, 0, 0)
	$spawners.add_child(character, true)

func _unhandled_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return
	if event.button_index != MOUSE_BUTTON_LEFT or not event.pressed:
		return
	character.destination = event.global_transform.origin
	character.create_path()

func _on_body_entered() -> void:
	print("ENTROU")
