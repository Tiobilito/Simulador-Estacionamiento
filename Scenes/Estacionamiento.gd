extends RigidBody2D

@export var Ocupado: bool = false
var main

# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group("Carro"):
		Ocupado = true
		$Timer.start(main.ExitTime)

func _on_timer_timeout():
	Ocupado = false
