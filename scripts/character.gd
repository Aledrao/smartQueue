extends CharacterBody3D

@export var speed : float = 2

@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D
@onready var nav_target: Marker3D = $"../NavTarget"
@onready var nav_target_2: Marker3D = $"../NavTarget2"

var changeTarget: bool = false

func _physics_process(delta: float) -> void:
	if changeTarget == false:
		navigation_agent.target_position = nav_target.global_transform.origin
	else:
		navigation_agent.target_position = nav_target_2.global_transform.origin

	var current_location = global_transform.origin
	var next_location = navigation_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * speed

	velocity = new_velocity
	move_and_slide()

func _on_area_3d_body_exited(body: Node3D) -> void:
	changeTarget = true


func _on_target_tree_entered() -> void:
	print("TESTE")
