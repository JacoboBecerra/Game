extends CharacterBody2D


const SPEED = 40.0
var left_limit: float = 605.0  # Límite izquierdo en la posición X
var right_limit: float = 850.0  # Límite derecho en la posición X
@onready var animation_player = $AnimatedSprite2D


var direction: int = 1  # Dirección inicial (1 = derecha, -1 = izquierda)


func _ready() -> void:
	$AnimatedSprite2D.play("walk")
	

	#$AnimatedSprite2D.scale.x = -1

func _physics_process(delta):
	# Movimiento continuo en la dirección actual
	position.x += SPEED * direction * delta
	
	# Cambiar de dirección al alcanzar los límites
	if position.x >= right_limit:
		$AnimatedSprite2D.flip_h = true
		direction = -1  # Cambia a izquierda
		animation_player.play("walk")
	elif position.x <= left_limit:
		$AnimatedSprite2D.flip_h = false
		direction = 1 
		animation_player.play("walk")
