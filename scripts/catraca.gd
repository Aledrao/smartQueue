extends Node3D

func _on_vira_area_entered(area: Area3D) -> void:
	$AnimationPlayer.play("passar")
