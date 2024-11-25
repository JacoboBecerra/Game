extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		$AudioStreamPlayer2D.play()
		body.visible = false
		await get_tree().create_timer(1.25).timeout
		get_tree().reload_current_scene()
