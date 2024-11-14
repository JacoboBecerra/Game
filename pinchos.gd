extends CharacterBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		body.disminuir_vida(position.x)
