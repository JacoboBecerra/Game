extends Control


# Variable local para habilitar el juego
var jugar = false

# Nodo de entrada de texto
@onready var username_input = $LineEdit  # Ruta al nodo LineEdit

func _ready() -> void:
	# Configurar el texto inicial del campo de entrada
	username_input.placeholder_text = "Username"
	username_input.text = ""  # Limpiar cualquier texto anterior
	jugar = false  # Asegurarse de que está en su estado inicial

func _on_button_pressed() -> void:
	if jugar:
		get_tree().change_scene_to_file("res://Nivel1.tscn")  # Cambiar a la escena del nivel
		Global.coins = 0
	else:
		print("Porfavor completa el campo requerido o pulsa enter sobre tu username para confirmarlo antes de seguir")

func _on_line_edit_text_submitted(new_text: String) -> void:
	# Capturar el texto introducido por el usuario
	var username = username_input.text.strip_edges()  # Eliminar espacios en blanco

	if username.is_empty():
		print("El nombre de usuario no puede estar vacío")
	else:
		# Guardar el nombre de usuario en la variable global
		Global.username = username
		jugar = true  # Permitir que se inicie el juego
		print("Nombre de usuario guardado: ", Global.username)
