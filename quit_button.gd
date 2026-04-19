extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if button_pressed == true:
		$"../PlayButton".disabled = false
		$"../CreditButton".disabled = false
		$"../Credit_Potion_Guy_Button".visible = false
		visible = false
		$"../Credits2".visible = false
		$"../Credits1".visible = false
