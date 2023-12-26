extends Node3D

const NPC = preload("res://scenes/character.tscn")

var tempo = 0

func _physics_process(delta: float) -> void:
	tempo += delta

	if tempo > 2:
		spawn_npc(delta)
		tempo = 0

func spawn_npc(delta):
	var new_npc = NPC.instantiate()
	new_npc.get_node(".").transform.origin.x = new_npc.get_node(".").transform.origin.x - 30 * delta
	new_npc.get_node(".").transform.origin = get_node("npc").transform.origin
	get_node("../").add_child(new_npc)
