extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Añadir otra area con otro colision shape y poner un on area entered que emita el sonido
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Finn":
		visible=false
		body.incrementar_moneda()
		body.disminuir_nivel()
		queue_free()
		

		
	
