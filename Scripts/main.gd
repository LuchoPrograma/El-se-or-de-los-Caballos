extends Node

@export var horse: PackedScene

var player1_controlls = ["LEFT", "RIGHT", "UP", "DOWN"]
var player2_controlls = ["W","A","S","D"]

var is_game_just_started:bool = true

var randomized_player1_input =[]
var randomized_player2_input = []
#var input_player1 = []
var input_player1:String
var input_player2:String

var spawner_location 
signal game_started

func _ready() -> void:
	$PreparationTimer.start()
	is_game_just_started = true
	randomize_input_pl1()
	randomize_input_pl2()
	
	
	
	
func _process(delta: float) -> void:
	if is_game_just_started:
		$GUI/GetReadyText.show()
		$GUI/MusicaMenu.stop()
		$MusicaDeFondo.play()
		$GUI/Timer.text = str(int($PreparationTimer.time_left))
	else:
		$GUI/Timer.text = str(int($Timer.time_left))
	
		player1_input()
		player2_input()

		spawner_location = randf()
		$HorseSpawner/PathFollow2D.progress_ratio = spawner_location
	

func player1_input():
	if Input.is_action_just_pressed("up_arrow"):
		#input_player1.append(player1_controlls[2])
		input_player1 = player1_controlls[2]
	if Input.is_action_just_pressed("left_arrow"):
		#input_player1.append(player1_controlls[0])
		input_player1 = player1_controlls[0] 
	if Input.is_action_just_pressed("down_arrow"):
		#input_player1.append(player1_controlls[3])
		input_player1 = player1_controlls[3]
	if Input.is_action_just_pressed("right_arrow"):
		#input_player1.append(player1_controlls[1])
		input_player1 = player1_controlls[1]
		
		
	if randomized_player1_input.size() > 0 and input_player1 != "":
		if randomized_player1_input[0] == input_player1:
			print("EXITO")
			randomize_input_pl1()
			$Aguas.open_tides_pl1()
		else:
			print("FALLO")
			randomize_input_pl1()
			$Aguas.close_tides_pl1()

func player2_input():
	#var player2_controlls = ["W","A","S","D"]
	if Input.is_action_just_pressed("up_key"):
		#input_player1.append(player1_controlls[2])
		
		input_player2 = player2_controlls[0]
	if Input.is_action_just_pressed("left_key"):
		#input_player1.append(player1_controlls[0])
		input_player2 = player2_controlls[1] 
	if Input.is_action_just_pressed("down_key"):
		#input_player1.append(player1_controlls[3])
		input_player2 = player2_controlls[2]
	if Input.is_action_just_pressed("right_key"):
		#input_player1.append(player1_controlls[1])
		input_player2 = player2_controlls[3]
		
		
	if randomized_player2_input.size() > 0 and input_player2 != "":
		if randomized_player2_input[0] == input_player2:
			print("EXITO")
			randomize_input_pl2()
			$Aguas.open_tides_pl2()
		else:
			print("FALLO")
			randomize_input_pl2()
			$Aguas.close_tides_pl2()
	
func randomize_input_pl1() -> void:
	randomized_player1_input.clear()
	input_player1 = ""
	var randin = randi_range(0,3)
	randomized_player1_input.append(player1_controlls[randin])
	$"GUI/Controls/ColorRect2/Player 1".text = randomized_player1_input[0]
	
func randomize_input_pl2():
	input_player2 = ""
	randomized_player2_input.clear()
	var randin2 =  randi_range(0,3)
	randomized_player2_input.append(player2_controlls[randin2])
	$"GUI/Controls/ColorRect/Player 2".text = randomized_player2_input[0]
	
func _on_spawn_timer_timeout() -> void:
	var newHorse = horse.instantiate()
	get_node("HorseSpawner").add_child(newHorse)
	newHorse.global_position = $HorseSpawner/PathFollow2D.position
	
func _on_timer_timeout() -> void:
	get_node("HorseSpawner").queue_free()
	$GUI/VictoryScreen.show()
	get_tree().paused = true
	await get_tree().create_timer(3).timeout
	get_tree().reload_current_scene()

func _on_preparation_timer_timeout() -> void:
	is_game_just_started = false
	emit_signal("game_started")
	$GUI/GetReadyText.hide()
