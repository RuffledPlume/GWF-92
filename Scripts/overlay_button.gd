extends TextureButton

var Unpressed_Disabled = preload("res://Assets/Buttons/Guide_Invisible_Unpressed_Disabled.png")
var Pressed_Disabled = preload("res://Assets/Buttons/Guide_Visible_Pressed_Disabled.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if button_pressed == true:
		texture_disabled = Pressed_Disabled
		$"../Cauldron_Guide".visible = false
	else:
		texture_disabled = Unpressed_Disabled
		$"../Cauldron_Guide".visible = true
	
