extends Area2D

var distance_travelled : float = 0

func _process(delta: float) -> void:
	position.x -=1.25
	distance_travelled += 1
	if distance_travelled >= 130:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		body.disminuir_vida(position.x)
		queue_free()
