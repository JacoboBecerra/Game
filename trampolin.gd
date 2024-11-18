extends CharacterBody2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		body.trampolin()
		$AnimatedSprite2D.play("idle")
		await get_tree().create_timer(1.0).timeout
		$AnimatedSprite2D.play("wait")
