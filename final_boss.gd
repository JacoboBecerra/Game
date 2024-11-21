extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	pass



	move_and_slide()


func _on_hitbox_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_canvas_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
