extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $"../HealthFruit".button_pressed == true || $"../ManaFruit".button_pressed == true || $"../StaminaFruit".button_pressed == true:
		disabled = false
	else:
		disabled = true
