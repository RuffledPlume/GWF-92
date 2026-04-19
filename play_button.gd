extends TextureButton

@export
var AnimPlayer : AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_pressed)

func _load_scene() -> void:
	get_tree().change_scene_to_file("res://cauldron.tscn")
	

func _on_pressed() -> void:
	disabled = true
	AnimPlayer.play("OutroAnim")
	TransitionManagerInstance.play_transition_with_event(_load_scene)
