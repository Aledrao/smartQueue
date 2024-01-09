extends CharacterBody3D

@export var speed : float = 2
@export var accel = 10
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D

var navPosition
var changeTarget: int = 0
var targetArea
@onready var filaEnterUm = get_node("/root/catraca/filaEntrada1")

func _ready() -> void:
	changeTarget = 0
	navPosition = get_tree().get_root()

func _physics_process(delta: float) -> void:
	if changeTarget == 0:
		navigation_agent.target_position = Caminhos.sceneTestInicio
	elif changeTarget == 1:
		if Caminhos.catracaUmUsando == true:
			navigation_agent.target_position = Caminhos.filaEntrada1
		else:
			navigation_agent.target_position = Caminhos.sceneTest1
	elif changeTarget == 2:
		navigation_agent.target_position = Caminhos.sceneTest2

	var current_location = global_transform.origin
	var next_location = navigation_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * speed

	velocity = new_velocity
	move_and_slide()

func _on_area_3d_area_entered(area: Area3D) -> void:
	changeTarget += 1


