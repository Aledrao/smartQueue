extends Node3D

func _on_passagem_fora_area_exited(area: Area3D) -> void:
	$AnimationPlayer.play("passar")
	Caminhos.arrayPassandoCatracas[0] = true


func _on_passagem_dentro_area_exited(area: Area3D) -> void:
	Caminhos.arrayPassandoCatracas[0] = false
