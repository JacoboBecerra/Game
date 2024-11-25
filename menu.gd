extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/Start_game.grab_focus()
	$WaterA8Frames2/AnimatedSprite2D.play("idle")
	$WaterA8Frames2/Sun.play("idle")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://pantallatuto.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://tutorial.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://settings.tscn")
