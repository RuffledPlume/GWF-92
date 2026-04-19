extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_pressed() -> void:
	if button_pressed == true:
		$"../Credits1".visible = true
		$"../PlayButton".disabled = true
		disabled = true
		$"../Credit_Potion_Guy_Button".visible = true
		$"../Quit_Button".visible = true
		
