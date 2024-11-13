extends Node

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Finn":
		get_tree().reload_current_scene()
