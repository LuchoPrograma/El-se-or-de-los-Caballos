extends Node2D

var closing_velocity = 200
@export var opening_velocity = 100
var is_olaIzq_in_redZone:bool = false
var is_olaDer_in_redZone:bool = false
var is_game_started: bool = false

func _ready() -> void:
	is_game_started = false
	get_node(get_parent().get_path()).game_started.connect(_on_game_started)

func _physics_process(delta: float) -> void:
	
	
	if is_game_started:
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
		$ola_derecha.linear_velocity.x = -opening_velocity/1.5
func close_tides_pl2():
	if not is_olaIzq_in_redZone:
		$ola_izquierda.linear_velocity.x = opening_velocity/1.5
	
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

func _on_game_started():
	is_game_started = true

#func _on_ola_izquierda_body_entered(body: Node) -> void:
#


func _on_horse_detector_body_entered(body: Node2D) -> void:

	if body.is_horse:
		get_node("Main/GUI").game_over()
