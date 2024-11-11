extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Finn":
		get_tree().reload_current_scene()
 # Replace with function body.
