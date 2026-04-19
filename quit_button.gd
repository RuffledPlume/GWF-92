extends TextureButton

func _show_main_menu() -> void:
	$"../PlayButton".disabled = false
	$"../CreditButton".disabled = false
	$"../Credit_Potion_Guy_Button".visible = false
	visible = false
	$"../Credits2".visible = false
	$"../Credits1".visible = false
	
func _process(delta: float) -> void:
	if button_pressed == true:
		TransitionManagerInstance.play_transition_with_event(_show_main_menu)
