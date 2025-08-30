extends Node2D

var closing_velocity = 200
@export var opening_velocity = 100

func _physics_process(delta: float) -> void:
	$ola_izquierda.constant_force.x = closing_velocity
	$ola_derecha.constant_force.x = -closing_velocity
	
	#if Input.is_action_just_pressed("ui_accept"):
		#open_tides()
	
func open_tides():
	$ola_derecha.linear_velocity.x = opening_velocity
	$ola_izquierda.linear_velocity.x = -opening_velocity
	
func close_tides():
	$ola_derecha.linear_velocity.x = -opening_velocity/2
	$ola_izquierda.linear_velocity.x = opening_velocity/2
	
	
