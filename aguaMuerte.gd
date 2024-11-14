extends CharacterBody2D

func _ready() -> void:
	$AnimatedSprite2D.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.





func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		body.disminuir_vida(position.x)
 # Replace with function body.
