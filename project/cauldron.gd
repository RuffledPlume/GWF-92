extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("res://Orders.dtl")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_cauldron_fill_perfect() -> void:
	Dialogic.start("res://perfect.dtl")


func _on_cauldron_fill_pretty_good() -> void:
	Dialogic.start("res://Pretty Good.dtl")


func _on_cauldron_fill_okay() -> void:
	Dialogic.start("res://Okay.dtl")


func _on_cauldron_fill_meh() -> void:
	Dialogic.start("res://Meh.dtl")


func _on_cauldron_fill_horrible() -> void:
	Dialogic.start("res://Horrible.dtl")


func _on_cauldron_fill_wrong_potion() -> void:
	Dialogic.start("res://Wrong_Potion.dtl")
