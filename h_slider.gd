extends HSlider

@onready var color_rect = $"../ColorRect" # Accede al ColorRect en la escena

func _ready() -> void:
	color_rect.color = Color(1, 1, 1, 0)  # Transparente, sin filtro


func _on_drag_ended(value_changed: bool) -> void:
	$"../AudioStreamPlayer2D".play()
	



func _on_value_changed(value: float) -> void:
	$"../AudioStreamPlayer2D".volume_db = value
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu.tscn")


func _on_off_pressed() -> void:
	color_rect.color = Color(1, 1, 1, 0)  # Transparente, sin filtro


func _on_on_pressed() -> void:
	color_rect.color = Color(0.8, 0.2, 0.2, 0.4)
