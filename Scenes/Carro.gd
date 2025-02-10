extends RigidBody2D

@export var Estacionado: bool = false
var posicion_anterior
var Movimiento = false
var Main

# Called when the node enters the scene tree for the first time.
func _ready():
	posicion_anterior = position
	Main = get_parent()
	$Label.text = str(Main.Contador) 
	Main.Contador = Main.Contador + 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position != posicion_anterior and not Movimiento:
		Movimiento = true
		Estacionado = true
		$Timer.start(Main.ExitTime)

func _on_timer_timeout():
	queue_free()
