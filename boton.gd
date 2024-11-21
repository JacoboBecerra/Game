extends StaticBody2D

var pulse = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pulse== false:
		$AnimatedSprite2D.play("idle")
	if pulse == true:
		$AnimatedSprite2D.play("pulse")



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		pulse = true
		$AudioStreamPlayer2D.play()
		get_tree().queue_delete($CollisionShape2D)
