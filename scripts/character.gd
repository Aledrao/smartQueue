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
	if ((Caminhos.passandoCatraca == true) and (changeTarget == 1)):
		navigation_agent.target_position = acessarFila()
		#verificarProximaPosicaoFila()
	else:
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
	print("POSICAO: ", posicaoAtualFila == 0)
	print("CAMINHOS: ", Caminhos.ativarFilaEntrada)
	print("RESPOSTAS: ", posicaoAtualFila == 0 and Caminhos.ativarFilaEntrada == false)
	if posicaoAtualFila == 0:
		for i in 11:
			print("CONTADOR: ", i)
			if(Caminhos.arrayOcupaPosicoesFilaEntrada[i] == false):
				posicaoAtualFila = i + 1
				Caminhos.arrayOcupaPosicoesFilaEntrada[i] = true
				print("LOCAL: ", Caminhos.arrayOcupaPosicoesFilaEntrada[i])
				return Caminhos.arrayPosicaoFilaEntradaTelaTeste[i]
	return Caminhos.arrayPosicaoFilaEntradaTelaTeste[posicaoAtualFila - 1]

func verificarProximaPosicaoFila() -> void:
	if posicaoAtualFila == 1:
		Caminhos.passandoCatraca = false
	else:
		if Caminhos.arrayOcupaPosicoesFilaEntrada[posicaoAtualFila - 1] == false:
			posicaoAtualFila -= 1

