extends Node2D

@export
var AnimPlayer : AnimationPlayer

func _enter_tree() -> void:
	AnimPlayer.play("IntroAnim")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("res://Dialogic/Tutorial.dtl")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $Mute_Button.button_pressed == false && $Level_Background.playing == false:
		$Level_Background.playing = true


func _on_cauldron_fill_perfect() -> void:
	if Dialogic.VAR.Current_Customer == "Adventurer":
		Dialogic.start("res://Dialogic/Adventurer/Adv_Perfect.dtl")
	elif Dialogic.VAR.Current_Customer == "Assassin":
		Dialogic.start("res://Dialogic/Assassin/Ass_Perfect.dtl")
	elif  Dialogic.VAR.Current_Customer == "Guard":
		Dialogic.start("res://Dialogic/Guard/Gua_Perfect.dtl")
	elif  Dialogic.VAR.Current_Customer == "Nobleman":
		Dialogic.start("res://Dialogic/Nobleman/Nob_Perfect.dtl")
	else:
		pass

func _on_cauldron_fill_pretty_good() -> void:
	if Dialogic.VAR.Current_Customer == "Adventurer":
		Dialogic.start("res://Dialogic/Adventurer/Adv_Good.dtl")
	elif Dialogic.VAR.Current_Customer == "Assassin":
		Dialogic.start("res://Dialogic/Assassin/Ass_Good.dtl")
	elif Dialogic.VAR.Current_Customer == "Guard":
		Dialogic.start("res://Dialogic/Guard/Gua_Good.dtl")
	elif Dialogic.VAR.Current_Customer == "Nobleman":
		Dialogic.start("res://Dialogic/Nobleman/Nob_Good.dtl")
	else:
		pass

func _on_cauldron_fill_okay() -> void:
	if Dialogic.VAR.Current_Customer == "Adventurer":
		Dialogic.start("res://Dialogic/Adventurer/Adv_Okay.dtl")
	elif Dialogic.VAR.Current_Customer == "Assassin":
		Dialogic.start("res://Dialogic/Assassin/Ass_Okay.dtl")
	elif Dialogic.VAR.Current_Customer == "Guard":
		Dialogic.start("res://Dialogic/Guard/Gua_Okay.dtl")
	elif Dialogic.VAR.Current_Customer == "Nobleman":
		Dialogic.start("res://Dialogic/Nobleman/Nob_Okay.dtl")
	else:
		pass


func _on_cauldron_fill_meh() -> void:
	if Dialogic.VAR.Current_Customer == "Adventurer":
		Dialogic.start("res://Dialogic/Adventurer/Adv_Meh.dtl")
	elif Dialogic.VAR.Current_Customer == "Assassin":
		Dialogic.start("res://Dialogic/Assassin/Ass_Meh.dtl")
	elif Dialogic.VAR.Current_Customer == "Guard":
		Dialogic.start("res://Dialogic/Guard/Gua_Meh.dtl")
	elif Dialogic.VAR.Current_Customer == "Nobleman":
		Dialogic.start("res://Dialogic/Nobleman/Nob_Meh.dtl")
	else:
		pass


func _on_cauldron_fill_horrible() -> void:
	if Dialogic.VAR.Current_Customer == "Adventurer":
		Dialogic.start("res://Dialogic/Adventurer/Adv_Horrible.dtl")
	elif Dialogic.VAR.Current_Customer == "Assassin":
		Dialogic.start("res://Dialogic/Assassin/Ass_Horrible.dtl")
	elif Dialogic.VAR.Current_Customer == "Guard":
		Dialogic.start("res://Dialogic/Guard/Gua_Horrible.dtl")
	elif Dialogic.VAR.Current_Customer == "Nobleman":
		Dialogic.start("res://Dialogic/Nobleman/Nob_Horrible.dtl")
	else:
		pass


func _on_cauldron_fill_wrong_potion() -> void:
	if Dialogic.VAR.Current_Customer == "Adventurer":
		Dialogic.start("res://Dialogic/Adventurer/Adv_Wrong.dtl")
	elif Dialogic.VAR.Current_Customer == "Assassin":
		Dialogic.start("res://Dialogic/Assassin/Ass_Wrong.dtl")
	elif Dialogic.VAR.Current_Customer == "Guard":
		Dialogic.start("res://Dialogic/Guard/Gua_Wrong.dtl")
	elif Dialogic.VAR.Current_Customer == "Nobleman":
		Dialogic.start("res://Dialogic/Nobleman/Nob_Wrong.dtl")
	else:
		pass

func _load_main_menu() -> void:
	Dialogic.clear()
	get_tree().change_scene_to_file("res://title_screen.tscn")

func _on_quit_button_pressed() -> void:
	TransitionManagerInstance.play_transition_with_event(_load_main_menu)
	
	
