extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if button_pressed == true:
		$"../CauldronFill".tint_over = Color(1, 1, 1, 0)
	else:
		$"../CauldronFill".tint_over = Color(1, 1, 1, 1)
