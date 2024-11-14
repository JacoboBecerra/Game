extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Finn":
		#visible=false
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(0.3).timeout
		queue_free()
		
