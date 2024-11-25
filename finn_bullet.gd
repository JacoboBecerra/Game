extends Area2D

var speed : float = 200 # Velocidad de la bala
var bullet_direction : Vector2 = Vector2.ZERO
var distance_travelled : float = 0

func _process(delta: float) -> void:
	position += bullet_direction * speed * delta
	distance_travelled += 1
	if distance_travelled >= 50:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "FinalBoss":
		body.disminuir_vida()
		queue_free()
