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

func _physics_process(delta: float) -> void:
	print("FILA ATIVADA: ", (Caminhos.ativarFilaEntrada == true))
	print("PASSO: ", changeTarget, " ", changeTarget == 1)
	print("RESULTADO: ", (Caminhos.ativarFilaEntrada == true) and (changeTarget == 1))
	if (Caminhos.ativarFilaEntrada == true) and (changeTarget == 1):
		print("VAI FILA")
		navigation_agent.target_position = acessarFila()
		verificarProximaPosicaoFila()

	else:
		print("VAI CATRACA")
		if changeTarget == 0:
			navigation_agent.target_position = Caminhos.arrayCaminhosEntradaTelaTest[0]
		elif changeTarget == 1:
			navigation_agent.target_position = Caminhos.arrayCaminhosEntradaTelaTest[1]
		elif changeTarget == 2:
			navigation_agent.target_position = Caminhos.arrayCaminhosEntradaTelaTest[2]

	var current_location = global_transform.origin
	var next_location = navigation_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * speed

	velocity = new_velocity
	move_and_slide()

func _on_area_3d_area_entered(area: Area3D) -> void:
	changeTarget += 1

func acessarFila() -> Vector3:
	for i in 11:
		if !Caminhos.arrayocupaPosicoesFilaEntrada[i]:
			posicaoAtualFila = i
			return Caminhos.arrayPosicaoFilaEntradaTelaTeste[i]
		pass
	return Caminhos.arrayPosicaoFilaEntradaTelaTeste[9]

func verificarProximaPosicaoFila() -> void:
	if posicaoAtualFila == 1:
		Caminhos.ativarFilaEntrada = false
	else:
		if Caminhos.arrayocupaPosicoesFilaEntrada[posicaoAtualFila - 1] == false:
			posicaoAtualFila -= 1

