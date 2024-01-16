extends CharacterBody3D

@export var speed : float = 2
@export var accel = 10
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D
@onready var filaEnterUm = get_node("/root/catraca/filaEntrada1")

var navPosition
var changeTarget: int = 0
var targetArea
var posicaoAtualFila: int = 0

func _ready() -> void:
	changeTarget = 0
	navPosition = get_tree().get_root()

func _physics_process(delta: float) -> void:
	if !Caminhos.ativarFilaEntrada:
		if changeTarget == 0:
			navigation_agent.target_position = Caminhos.arrayCaminhosEntradaTelaTest[0]
		elif changeTarget == 1:
			if Caminhos.catracaUmUsando == true:
				navigation_agent.target_position = Caminhos.arrayCaminhosEntradaTelaTest[1]
			else:
				navigation_agent.target_position = Caminhos.sceneTest1
		elif changeTarget == 2:
			navigation_agent.target_position = Caminhos.arrayCaminhosEntradaTelaTest[2]
	else:
		navigation_agent.target_position = acessarFila()

	var current_location = global_transform.origin
	var next_location = navigation_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * speed

	velocity = new_velocity
	move_and_slide()

func _on_area_3d_area_entered(area: Area3D) -> void:
	changeTarget += 1

func acessarFila() -> Vector3:
	for i in 11:
		#var posicaoFila = str("Caminhos.posicaoFila",i)
		if !str("Caminhos.posicaoFila",i):
			posicaoAtualFila = i
			return Caminhos.posicaoFilaEntrada1
		pass
	return Caminhos.posicaoFilaEntrada1

func verificarProximaPosicaoFila() -> void:
	if posicaoAtualFila == 1:
		Caminhos.ativarFilaEntrada = false
	else:
		if Caminhos.ocupaFilaEntrada1:
			pass

