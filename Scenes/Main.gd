extends Node2D

@export var EnterTime: float
@export var ExitTime: float
@export var Contador: int = 0
@export var InsCarro: PackedScene
var lleno = false
var nodes = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$UI.visible = true
	$Timer.start(EnterTime)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	nodes.clear()
	for lugar in get_tree().get_nodes_in_group("Carro"):
		nodes.append(lugar)

	EnterTime = $UI/Control/MarginContainer/VBoxContainer/HBoxContainer/SpinBox.value
	ExitTime = $UI/Control/MarginContainer/VBoxContainer/HBoxContainer2/SpinBox.value

	if nodes.size() == 0:
		$UI/Control/MarginContainer/Label.text = "Estacionamiento vacio"
	elif nodes.size() == 12:
		$UI/Control/MarginContainer/Label.text = "Estacionamiento lleno"
	else:
		$UI/Control/MarginContainer/Label.text = " "

func _on_timer_timeout():
	nodes.clear()
	for lugar in get_tree().get_nodes_in_group("Carro"):
		nodes.append(lugar)

	if nodes.size() < 12:
		var instance = InsCarro.instantiate()
		add_child(instance)
		instance.position = $Marker2D.position
		for lugar in get_tree().get_nodes_in_group("Lugar"):
			if lugar.Ocupado == false:
				instance.position = lugar.position
				break

	$Timer.start(EnterTime)
	
