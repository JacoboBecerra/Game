extends CharacterBody2D
#añadir en el scrip de finn un metodo q cuente las muertes de los enemigos
#y que se una al scrip del enemigo body.enemgigos_dead() para pasar de nivel

const SPEED = 40.0
var left_limit: float = 605.0  # Límite izquierdo en la posición X
var right_limit: float = 850.0  # Límite derecho en la posición X
@onready var animation_player = $AnimatedSprite2D


var direction: int = 1  # Dirección inicial (1 = derecha, -1 = izquierda)


func _ready() -> void:
	$AnimatedSprite2D.play("walk")
	

	#$AnimatedSprite2D.scale.x = -1

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
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



func _on_area_2_dmatar_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		body.enemy_sound()
		queue_free()



func _on_area_2_dmorir_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		body.disminuir_vida(position.x)
