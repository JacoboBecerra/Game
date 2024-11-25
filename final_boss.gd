extends CharacterBody2D

@export var bullet : PackedScene
var puedodisparar:bool = true
var vidas = 3


func _ready() -> void:
	$AnimatedSprite2D.play("idle")


func disminuir_vida():
	vidas = vidas - 1
	$hurt.play()
	print("tienes " + str(vidas) + " vidas")
	if vidas == 0:
		await get_tree().create_timer(2.05).timeout
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RayCast2D.is_colliding():
		var obj = $RayCast2D.get_collider()
		if obj and obj.is_in_group("Finn") and puedodisparar and vidas>0:
			puedodisparar = false
			$Timer.start()
			shoot()
		else:
			pass
			
	
	if vidas == 0:
		pass

func shoot():
	$AnimatedSprite2D.play("shoot")
	$AudioStreamPlayer2D.play()
	var newbullet = bullet.instantiate()
	newbullet.global_position = $spawbullet.global_position
	get_parent().add_child(newbullet)
	animacion()

func animacion():
	await get_tree().create_timer(0.9).timeout
	$AnimatedSprite2D.play("idle")


func _on_timer_timeout() -> void:
	puedodisparar = true
