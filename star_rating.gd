extends TextureProgressBar

var total_score = 0.0
var total_customers = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_customer_served)
	Dialogic.signal_event.connect(_on_perfect_serve)
	Dialogic.signal_event.connect(_on_good_serve)
	Dialogic.signal_event.connect(_on_okay_serve)
	Dialogic.signal_event.connect(_on_meh_serve)
	Dialogic.signal_event.connect(_on_horrible_serve)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	value = total_score / total_customers

func _on_customer_served(argument:String):
	if argument == "customer_served":
		total_customers += 1

func _on_perfect_serve(argument:String):
	if argument == "perfect_serve":
		total_score += 1

func _on_good_serve(argument:String):
	if argument == "good_serve":
		total_score += .9

func _on_okay_serve(argument:String):
	if argument == "okay_serve":
		total_score += .8

func _on_meh_serve(argument:String):
	if argument == "meh_serve":
		total_score += .6

func _on_horrible_serve(argument:String):
	if argument == "horrible_serve":
		total_score += .2
