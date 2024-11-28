extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CharacterBody2D/AnimatedSprite2D.play("idle")
	send_post_new_score()
	send_get_request()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Nivel1.tscn")


func send_get_request():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.connect("request_completed", _on_server_has_responded)
	var headers = ["Content-Type: application/json", "Client-Secret: abc"] # CLIENT_SECRET should never be public! If leaked, ALL clients should be force-updated to use a new one
	http_request.request("http://127.0.0.1:8000/score", headers, HTTPClient.METHOD_GET)

func send_post_new_score():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	var body = JSON.stringify({"username": Global.username, "score": Global.coins})
	var headers = ["Content-Type: application/json", "Client-Secret: abc"] # CLIENT_SECRET should never be public! If leaked, ALL clients should be force-updated to use a new one
	http_request.request("http://127.0.0.1:8000/score", headers, HTTPClient.METHOD_POST, body)

func _on_server_has_responded(result, response_code, headers, body):
	var response = JSON.parse_string(body.get_string_from_utf8())
	print("Server response:")
	print(Global.username + " : " + str(Global.coins))
	
