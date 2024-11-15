extends Area2D



func _process(delta: float) -> void:
	position.x -=0.8


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		body.disminuir_vida(position.x)
