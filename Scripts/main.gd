extends Node

var player1_controlls = ["LEFT", "RIGHT", "UP", "DOWN"]
var randomized_input =[]
var input_player1 = []
var inpu:String

func _ready() -> void:
	print("FALLO")
	randomize_input()
	


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		randomize_input()

	
	if Input.is_action_just_pressed("up_arrow"):
		input_player1.append(player1_controlls[2])
		inpu = player1_controlls[2]
	if Input.is_action_just_pressed("left_arrow"):
		input_player1.append(player1_controlls[0])
	if Input.is_action_just_pressed("down_arrow"):
		input_player1.append(player1_controlls[3])
	if Input.is_action_just_pressed("right_arrow"):
		input_player1.append(player1_controlls[1])
		
		
	if randomized_input.size() == input_player1.size() && randomized_input.size() > 0:
		if randomized_input[0] == input_player1[0]:
			print("EXITO")
			randomize_input()
			$Aguas.open_tides()
		else:
			print("FALLO")
			randomize_input()
			$Aguas.close_tides()
			
	
func randomize_input() -> void:
	
	randomized_input.clear()
	input_player1.clear()
	var randin = randi_range(0,3)
	randomized_input.append(player1_controlls[randin])
	$"GUI/Player 1".text = randomized_input[0]
	$"GUI/Player 2".text = randomized_input[0]
	
