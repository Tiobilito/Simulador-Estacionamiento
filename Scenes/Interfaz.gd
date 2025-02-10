extends CanvasLayer

var main
var rng = RandomNumberGenerator.new()
var iniSpeeds = [0.5, 1, 2]

# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_parent()
	$Control/MarginContainer/VBoxContainer/HBoxContainer/SpinBox.value = iniSpeeds[rng.randi_range(0,2)]
	$Control/MarginContainer/VBoxContainer/HBoxContainer2/SpinBox.value = iniSpeeds[rng.randi_range(0,2)]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	get_tree().reload_current_scene()

func _on_button_2_pressed():
	get_tree().quit()
