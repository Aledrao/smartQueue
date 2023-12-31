extends Node3D

const NPC = preload("res://scenes/character.tscn")

var tempoSaida = 0
var tempoSorteado = 0

func _physics_process(delta: float) -> void:
	tempoSaida += delta

	if tempoSorteado == 0:
		tempoSorteado = randi() % Caminhos.tempoMaximoCenaUmRodadaUm

	if tempoSaida > tempoSorteado:
		spawn_npc(delta)
		tempoSaida = 0
		tempoSorteado = 0

func spawn_npc(delta):
	var new_npc = NPC.instantiate()
	new_npc.get_node(".").transform.origin.x = new_npc.get_node(".").transform.origin.x - 30 * delta
	new_npc.get_node(".").transform.origin = get_node(sorteiaLadoNpc()).transform.origin
	get_node("../").add_child(new_npc)

func sorteiaLadoNpc() -> String:
	var numeroNpc = RandomNumberGenerator.new()
	numeroNpc.randomize()
	return str("npc", numeroNpc.randi_range(1, 2))
