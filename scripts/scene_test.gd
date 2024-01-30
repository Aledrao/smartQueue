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

func _on_posicao_1_body_entered(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[0] = true
	Caminhos.ativarFilaEntrada = true

func _on_posicao_1_body_exited(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[0] = false

func _on_posicao_2_body_entered(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[1] = true

func _on_posicao_2_body_exited(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[1] = false

func _on_posicao_3_body_entered(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[2] = true

func _on_posicao_3_body_exited(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[2] = false

func _on_posicao_4_body_entered(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[3] = true

func _on_posicao_4_body_exited(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[3] = false

func _on_posicao_5_body_entered(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[4] = true

func _on_posicao_5_body_exited(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[4] = false

func _on_posicao_6_body_entered(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[5] = true

func _on_posicao_6_body_exited(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[5] = false

func _on_posicao_7_body_entered(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[6] = true

func _on_posicao_7_body_exited(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[6] = false

func _on_posicao_8_body_entered(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[7] = true

func _on_posicao_8_body_exited(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[7] = false

func _on_posicao_9_body_entered(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[8] = true

func _on_posicao_9_body_exited(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[8] = false

func _on_posicao_10_body_entered(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[9] = true

func _on_posicao_10_body_exited(body: Node3D) -> void:
	Caminhos.arrayocupaPosicoesFilaEntrada[9] = false
