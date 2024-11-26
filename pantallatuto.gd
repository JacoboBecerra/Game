extends Control

var accept = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if accept == true:
		get_tree().change_scene_to_file("res://username.tscn")
	


func _on_check_button_pressed() -> void:
	accept = true


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu.tscn")
