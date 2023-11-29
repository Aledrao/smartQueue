extends Area3D

@onready var area_3d: Area3D = $"."

var changeTarget: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_3d.body_entered.connect(on_body_entered)
	$".".connect("body_entered", on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_body_entered() -> void:
	changeTarget = true
	print("ENTROU")
