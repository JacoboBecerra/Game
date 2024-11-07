extends CharacterBody2D


const SPEED = 175.0
const JUMP_VELOCITY = -300.0

var monedas = 0



func _ready() -> void:
	$AnimatedSprite2D.play("idle")
	
func incrementar_moneda():
	monedas = monedas + 1
	print("Tienes " + str(monedas) + " monedas")	
	
func _process(delta: float) -> void:
	$Camera2D/CoinsCollecter.text = str(monedas)
	
	if monedas==3:
		get_tree().change_scene_to_file("res://Nivel_2.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
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
