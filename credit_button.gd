extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_pressed)

func _show_credits() -> void:
		$"../Credits1".visible = true
		$"../PlayButton".disabled = true
		disabled = true
		$"../Credit_Potion_Guy_Button".visible = true
		$"../Quit_Button".visible = true
	
func _on_pressed() -> void:
	if button_pressed == true:
		TransitionManagerInstance.play_transition_with_event(_show_credits)
		
