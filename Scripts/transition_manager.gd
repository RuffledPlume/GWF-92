class_name TransitionManager 
extends Node2D

@export
var AnimPlayer : AnimationPlayer

var on_screen_hidden_valid : bool
var on_screen_hidden : Callable

func _ready() -> void:
	$CanvasLayer.visible = false
	AnimPlayer.animation_finished.connect(_transition_finished)

func play_transition_with_event(in_on_screen_hidden : Callable) -> void:
	on_screen_hidden = in_on_screen_hidden
	on_screen_hidden_valid = true
	$CanvasLayer.visible = true
	AnimPlayer.play("TransitionAnim")
	
func play_transition() -> void:
	on_screen_hidden_valid = false;
	$CanvasLayer.visible = true
	AnimPlayer.play("TransitionAnim")

func _on_screen_hidden() -> void:
	if on_screen_hidden_valid:
		on_screen_hidden.call()
	on_screen_hidden_valid = false

func _transition_finished() -> void:
	$CanvasLayer.visible = false
	
