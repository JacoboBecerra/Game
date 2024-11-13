extends CharacterBody2D


const SPEED = 40.0
var left_limit: float = 1595.0  # Límite izquierdo en la posición X
var right_limit: float = 2210.0  # Límite derecho en la posición X


var direction: int = 1  # Dirección inicial (1 = derecha, -1 = izquierda)


func _ready() -> void:
	pass
	

	#$AnimatedSprite2D.scale.x = -1

func _physics_process(delta):
	# Movimiento continuo en la dirección actual
	position.x += SPEED * direction * delta
	
	# Cambiar de dirección al alcanzar los límites
	if position.x >= right_limit:
		direction = -1  # Cambia a izquierda
	elif position.x <= left_limit:
		direction = 1 
