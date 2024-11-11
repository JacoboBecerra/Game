extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Finn":
		$AudioStreamPlayer2D.play()
		body.incrementar_moneda()
		await get_tree().create_timer(0.4).timeout
		queue_free()
		

		
	
