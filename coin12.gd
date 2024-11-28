extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	send_get_request()
	$AnimatedSprite2D.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
#Añadir otra area con otro colision shape y poner un on area entered que emita el sonido
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Finn":
		visible=false
		body.incrementar_moneda()
		body.disminuir_nivel()
		queue_free()
		
		
func send_get_request():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.connect("request_completed", _on_server_has_responded)
	var headers = ["Content-Type: application/json", "Client-Secret: abc"] # CLIENT_SECRET should never be public! If leaked, ALL clients should be force-updated to use a new one
	http_request.request("http://127.0.0.1:8000/coin", headers, HTTPClient.METHOD_GET)
	
func _on_server_has_responded(result, response_code, headers, body):
	var response = JSON.parse_string(body.get_string_from_utf8())
	print("Server response:")
	print(response)
	position.x = response.positionX
