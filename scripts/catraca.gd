extends Node3D

func _on_passagem_fora_area_exited(area: Area3D) -> void:
	$AnimationPlayer.play("passar")
	Caminhos.ativarFilaEntrada = true


func _on_passagem_dentro_area_exited(area: Area3D) -> void:
	Caminhos.ativarFilaEntrada = false
