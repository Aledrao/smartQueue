extends Node3D

func _on_passagem_area_entered(area: Area3D) -> void:
	$AnimationPlayer.play("passar")
	Caminhos.passandoCatraca = true
	print("++++++++++++++++++++++++++++++")

func _on_passagem_area_exited(area: Area3D) -> void:
	Caminhos.passandoCatraca = false
	print("---------------------------")
