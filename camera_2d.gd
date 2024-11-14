extends Camera2D


@onready var heart1 := get_node("corazon1")
@onready var heart2 := get_node("corazon2")
@onready var heart3 := get_node("corazon3")
@onready var heart4 := get_node("corazon4")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var heart1 = get_node("corazon1")
	var heart2 = get_node("corazon2")
	var heart3 = get_node("corazon3")
	var heart4 = get_node("corazon4")

func corazones_ui(vida):
	if vida == 0:
		heart1.visible=false
		get_tree().reload_current_scene()
	if vida == 1:
		heart2.visible=false
		heart1.visible=true
	if vida == 2:
		heart3.visible=false
		heart2.visible=true
	if vida == 3:
		heart4.visible=false
		heart3.visible=true
	if vida == 4:
		heart4.visible=true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
