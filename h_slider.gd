extends HSlider

@onready var player_scene = preload("res://Finn.tscn") 



func _on_drag_ended(value_changed: bool) -> void:
	$"../AudioStreamPlayer2D".play()
	



func _on_value_changed(value: float) -> void:
	$"../AudioStreamPlayer2D".volume_db = value
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu.tscn")


func _on_off_pressed() -> void:
	Global.vida = 2
	print("Jugarás con 2 vidas")


func _on_on_pressed() -> void:
	Global.vida = 3
	print("Jugarás con 3 vidas")


func _on_hard_pressed() -> void:
	Global.vida = 1
	print("Jugarás con 1 vida")
