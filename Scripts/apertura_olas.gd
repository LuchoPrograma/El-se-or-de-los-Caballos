extends Node2D

var closing_velocity = 100
@export var opening_velocity = 75
var is_olaIzq_in_redZone:bool = false
var is_olaDer_in_redZone:bool = false

func _physics_process(delta: float) -> void:
	
	if not is_olaIzq_in_redZone:
		$ola_izquierda.constant_force.x = closing_velocity
	if not is_olaDer_in_redZone:
		$ola_derecha.constant_force.x = -closing_velocity
		
	
	
	#if Input.is_action_just_pressed("ui_accept"):
		#open_tides()
	
func open_tides_pl1():
	$ola_derecha.linear_velocity.x = opening_velocity
func open_tides_pl2():
	$ola_izquierda.linear_velocity.x = -opening_velocity
	
func close_tides_pl1():
	if not is_olaDer_in_redZone:
		$ola_derecha.linear_velocity.x = -opening_velocity/2
func close_tides_pl2():
	if not is_olaIzq_in_redZone:
		$ola_izquierda.linear_velocity.x = opening_velocity/2
	
func _on_carril_body_entered(body: Node2D) -> void:
	if body == $ola_derecha:
		is_olaDer_in_redZone = true
		$ola_derecha.linear_velocity.x = 0
		$ola_derecha.constant_force.x = 0
		#$ola_derecha.freeze = true
		
	if body == $ola_izquierda:
		is_olaIzq_in_redZone = true
		$ola_izquierda.linear_velocity.x = 0
		$ola_izquierda.constant_force.x = 0
		
	#get_tree().reload_current_scene()
	#print("game over")
	#get_tree()
func _on_carril_body_exited(body: Node2D) -> void:
	if body == $ola_derecha:
		is_olaDer_in_redZone = false

	if body == $ola_izquierda:
		is_olaIzq_in_redZone = false


func _on_ola_derecha_body_entered(body: Node) -> void:
	print("colision!")
	$ola_izquierda.freeze = true
	$ola_derecha.freeze = true


#func _on_ola_izquierda_body_entered(body: Node) -> void:
#
