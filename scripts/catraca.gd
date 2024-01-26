extends Node3D

func _on_passagem_area_entered(area: Area3D) -> void:
	$AnimationPlayer.play("passar")
	Caminhos.ativarFilaEntrada = true
	print("++++++++++++++++++++++++++++++")

func _on_passagem_area_exited(area: Area3D) -> void:
	Caminhos.ativarFilaEntrada = false
	print("---------------------------")
