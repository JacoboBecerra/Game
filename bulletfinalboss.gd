extends CharacterBody2D

var speed : float = 50 # Velocidad de movimiento del enemigo
var player = null
var initial_x : float = 0
var vidas = 3

func _ready():
	# Verifica si hay nodos en el grupo antes de intentar acceder
	initial_x = position.x
	$AnimatedSprite2D.play("default")
	var nodes = get_tree().get_nodes_in_group("Finn")
	if nodes.size() > 0:
		player = nodes[0]
	else:
		print("Error: No nodes found in group 'Finn'")

func _process(delta: float) -> void:
	# Solo sigue al jugador si ha sido asignado
	if player != null:
		follow(delta)
		
	
	#llegada cierta distancia se elimina el proyectil
	if abs(position.x - initial_x) >= 250:
		$AnimatedSprite2D.play("bom")
		await get_tree().create_timer(1.0).timeout
		queue_free()	
	

func follow(delta: float):
	# Calcula la dirección hacia el jugador y mueve al enemigo
	velocity = position.direction_to(player.position) * speed
	move_and_slide()
	
	if velocity.x < 0: # Si se mueve a la izquierda
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0: # Si se mueve a la derecha
		$AnimatedSprite2D.flip_h = false
		
		
func destroid():
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		$AnimatedSprite2D.play("bom")
		await get_tree().create_timer(0.9).timeout
		queue_free()
