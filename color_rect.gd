extends ColorRect

@export var speed: float = 0.5

var hue: float = 0.0

func _process(delta: float) -> void:
	hue = fmod(hue + delta * speed, 1.0)
	
	color = Color.from_hsv(hue, 1.0, 1.0, 1.0)


func _on_button_pressed() -> void:
	pass # Replace with function body.
