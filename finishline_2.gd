extends Area2D


func _ready() -> void:
	$AnimatedSprite2D.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		body.incrementar_nivel2()
