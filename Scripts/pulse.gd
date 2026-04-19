extends Label

@export
var low_color := Color(1, 1, 1, 0.25)
@export
var high_color := Color(1, 1, 1, 1.0)
@export
var fade_speed := 3.0
@export
var pulse_speed := 1.0

var pulse_offset := 0.0
var fade := 0.0

func _ready() -> void:
	visibility_changed.connect(_visibility_changed)
	
func _visibility_changed() -> void:
	fade = 0.0
	
func _process(delta: float) -> void:
	if fade < 1.0:
		fade += fade_speed * delta
	pulse_offset += delta
	modulate = lerp(low_color, high_color, pingpong(pulse_offset, pulse_speed) / pulse_speed)
	modulate.a *= fade
