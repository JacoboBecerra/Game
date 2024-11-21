extends CharacterBody2D


const SPEED = 175.0
const JUMP_VELOCITY = -350.0

var monedas = 0
var daño = 0
var vida = 3
var control = 0
var nivel = 0
@onready var camara2D := get_node("Camera2D")




func _ready() -> void:
	$AnimatedSprite2D.play("idle")
	camara2D.corazones_ui(vida)
	
func enemy_sound():
	$enemy_death.play()

func disminuir_vida(enemypos):
	#$AnimatedSprite2D.play("hurt")
	var direcion_salto = position.x - enemypos
	if direcion_salto < 0:
		velocity.x = -800
		
	else:
		velocity.x = 800
	
	velocity.y = -400
	
	$AnimatedSprite2D.play("hurt")
	$AudioStreamPlayer2D.play()
	
	vida = vida - 1
	print("Tienes " + str(vida) + " vidas")
	
	camara2D.corazones_ui(vida)

func trampolin():
	velocity.y = -750
	$trampolin.play()
	


func incrementar_vida():
	vida = vida + 1
	print("Tienes " + str(vida) + " vidas")
	camara2D.corazones_ui(vida)

func incrementar_nivel():
	nivel = 1
	
func incrementar_nivel2():
	nivel = 2

func disminuir_nivel():
	nivel = 0

func incrementar_moneda():
	$coin.play()
	monedas = monedas + 1
	print("Tienes " + str(monedas) + " monedas")
	
func _process(delta: float) -> void:
	$Camera2D/CoinsCollecter.text = str(monedas)
	
	#if vida==4:
	#	get_tree().change_scene_to_file("res://Nivel_2.tscn")
	if monedas>=20:
		if nivel == 1:
			get_tree().change_scene_to_file("res://Nivel2.tscn")
		if nivel == 2:
			get_tree().change_scene_to_file("res://Nivel1.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		$jump.play()
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = 0

	move_and_slide()
