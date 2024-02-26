extends CharacterBody3D

@export var speed : float = 2
@export var accel = 10
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D

var navPosition
var changeTarget: int = 0
var targetArea
var posicaoAtualFila: int = 0

func _ready() -> void:
	changeTarget = 0
	navPosition = get_tree().get_root()
	Caminhos.arrayCatracasFuncionais[0] = true
	posicaoAtualFila = 0

func _physics_process(delta: float) -> void:
	if (Caminhos.ativarFilaEntrada and changeTarget == 1):
		navigation_agent.target_position = acessarFila()
		if(!Caminhos.passandoCatraca and changeTarget == 1):
			navigation_agent.target_position = sairFila()
		if !Caminhos.arrayOcupaPosicoesFilaEntrada.has(true):
			Caminhos.ativarFilaEntrada = false
	else:
		if Caminhos.passandoCatraca:
			Caminhos.ativarFilaEntrada = true

		posicaoAtualFila = 0
		navigation_agent.target_position = Caminhos.arrayCaminhosEntradaTelaTest[changeTarget]

	var current_location = global_transform.origin
	var next_location = navigation_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * speed

	velocity = new_velocity
	move_and_slide()

func _on_area_3d_area_entered(area: Area3D) -> void:
	if (changeTarget <= 1):
		changeTarget += 1

func acessarFila() -> Vector3:
	if posicaoAtualFila == 0:
		for i in 11:
			if(Caminhos.arrayOcupaPosicoesFilaEntrada[i] == false):
				posicaoAtualFila = i + 1
				Caminhos.arrayOcupaPosicoesFilaEntrada[i] = true
				return Caminhos.arrayPosicaoFilaEntradaTelaTeste[i]
	elif posicaoAtualFila == 1:
		if Caminhos.arrayOcupaPosicoesFilaEntrada[1] == false:
			posicaoAtualFila = 0
			Caminhos.ativarFilaEntrada = false
			return Caminhos.arrayCaminhosEntradaTelaTest[changeTarget]
	return Caminhos.arrayPosicaoFilaEntradaTelaTeste[posicaoAtualFila - 1]

func sairFila() -> Vector3:
	print("SAIR FILA")
	if posicaoAtualFila == 1:
		print("++PRIMEIRA POSICAO++")
		print("POSICAO FILA: ", posicaoAtualFila)
		print("ARRAY: ", Caminhos.arrayOcupaPosicoesFilaEntrada)
		posicaoAtualFila = 0
		Caminhos.arrayOcupaPosicoesFilaEntrada[posicaoAtualFila] = false
		return Caminhos.arrayCaminhosEntradaTelaTest[changeTarget]
	elif posicaoAtualFila > 1:
		print("ALÉM DA PRIMEIRA POSICAO")		
		if Caminhos.arrayOcupaPosicoesFilaEntrada[posicaoAtualFila - 2] == false:
			print("IR PARA FRENTE")
			Caminhos.arrayOcupaPosicoesFilaEntrada[posicaoAtualFila - 2] = true
			posicaoAtualFila -= 1
			return Caminhos.arrayPosicaoFilaEntradaTelaTeste[posicaoAtualFila]
	return Caminhos.arrayPosicaoFilaEntradaTelaTeste[posicaoAtualFila]

