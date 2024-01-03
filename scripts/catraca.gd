extends Node3D

var passando: bool = false

func _on_passagem_fora_area_exited(area: Area3D) -> void:
	passando = true
	$AnimationPlayer.play("passar")
	print("Nó entrada: ",$".".get_path())


func _on_passagem_dentro_area_exited(area: Area3D) -> void:
	passando = false
	print("Nó saida: ", $".".get_name())
