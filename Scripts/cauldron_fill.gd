extends TextureProgressBar

signal empty_cauldron
signal perfect
signal pretty_good
signal okay
signal meh
signal horrible
signal wrong_potion

var cooldown = 0
var sour = 0
var bitter = 0
var sweet = 0
var fullcauldron = 0
var flavor = ""
var magic = ""
var percentage = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_potion_ordered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	cooldown = max(cooldown - _delta, 0.0)
	if cooldown > 0:
		return
	
	# Determines if cauldron is filled, and shows the "Fill Potion" button
	fullcauldron = clamp(sour + sweet + bitter, 0, 100)
	# 25 - 75 is the range of which the progresses texture can repersent due to margin at top/bottom
	# This remapps the value using fullcauldron
	value = lerp(25, 75, fullcauldron / 100.0)
	if $"../PurpleGrape".button_pressed == true && fullcauldron < 100:
		sweet += 1
		cooldown = 0.075
	elif $"../GreenGrape".button_pressed == true && fullcauldron < 100:
		sour += 1
		cooldown = 0.075
	elif $"../WhiteGrape".button_pressed == true && fullcauldron < 100:
		bitter += 1
		cooldown = 0.075
	else:
		pass
	
	if fullcauldron == 100:
		$"../FullCauldron".visible = true

	if $"../HealthFruit".button_pressed == true:
		tint_progress = Color(1, 0, 0, .5)
		magic = "Health"
	elif $"../ManaFruit".button_pressed == true:
		tint_progress = Color(0, 0, 1, .5)
		magic = "Mana"
	elif $"../StaminaFruit".button_pressed == true:
		tint_progress = Color(0, 1, 0, .5)
		magic = "Stamina"
	else:
		tint_progress = Color(1, 1, 1, 1)
		magic = ""
# Grapes and Magic Fruit button signals below

func _on_full_cauldron_pressed() -> void:
	#Serves customer, resets value of progress bar for next potion, and then hides the "Fill Potion" button
	var Sweet_Percentage = abs(sweet - Dialogic.VAR.Sweet)
	var Bitter_Percentage = abs(bitter - Dialogic.VAR.Bitter)
	var Sour_Percentage = abs(sour - Dialogic.VAR.Sour)
	percentage = abs(100 - (Sweet_Percentage + Bitter_Percentage + Sour_Percentage))
	if percentage > 90:
		perfect.emit()
	elif percentage <= 90 && percentage > 80:
		pretty_good.emit()
	elif percentage <= 75 && percentage > 60:
		okay.emit()
	elif percentage <= 60 && percentage > 30:
		meh.emit()
	else:
		horrible.emit()
		
	if Dialogic.VAR.Magic != magic:
		wrong_potion.emit()
	else:
		pass
	value = 0
	sour = 0
	sweet = 0
	bitter = 0
	magic = ""
	$"../FullCauldron".visible = false
	empty_cauldron.emit()
	$"../OverlayButton".disabled = true
	$"../EmptyButton".disabled = true

func _on_potion_ordered(argument:String):
	if argument == "potion_ordered":
		print("Potion Ordered! Magic: ", Dialogic.VAR.Magic, " Sweet: ", Dialogic.VAR.Sweet, " Sour: ", Dialogic.VAR.Sour, " Bitter: ", Dialogic.VAR.Bitter)
		$"../HealthFruit".disabled = false
		$"../ManaFruit".disabled = false
		$"../StaminaFruit".disabled = false
		$"../EmptyButton".disabled = false
		$"../OverlayButton".disabled = false

func _on_empty_button_pressed() -> void:
	value = 0
	bitter = 0
	sweet = 0
	sour = 0
	magic = ""
	$"../FullCauldron".visible = false
	$"../HealthFruit".button_pressed = false
	$"../HealthFruit".disabled = false
	$"../ManaFruit".button_pressed = false
	$"../ManaFruit".disabled = false
	$"../StaminaFruit".button_pressed = false
	$"../StaminaFruit".disabled = false
