extends Node3D

var boneco = preload("res://scenes/character.tscn")

var tempo = 0

func _physics_process(delta: float) -> void:
	tempo += delta

	if tempo > 2:
		var pessoa = boneco.instantiate()
		pessoa.get_node(".").transform.origin.x = pessoa.get_node(".").transform.origin.x - 30 * delta
		pessoa.get_node(".").transform.origin = get_node("personagem").transform.origin
		get_node("../").add_child(pessoa)
		tempo = 0
