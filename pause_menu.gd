extends Control


# Called when the node enters the scene tree for the first time.
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		visible = not get_tree().paused
		print("Juego pausado")
		get_tree().paused = not get_tree().paused
