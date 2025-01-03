extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		$AudioStreamPlayer2D.play()
		body.visible = false
		self.visible = false
		await get_tree().create_timer(1.25).timeout
		get_tree().change_scene_to_file("res://Nivel_3.tscn")
	
