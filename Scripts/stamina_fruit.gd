extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_health_fruit_pressed() -> void:
	if $"../HealthFruit".button_pressed == true:
		disabled = true
	else:
		disabled = false

func _on_mana_fruit_pressed() -> void:
	if $"../ManaFruit".button_pressed == true:
		disabled = true
	else:
		disabled = false

func _on_cauldron_fill_empty_cauldron() -> void:
	button_pressed = false
	disabled = true
