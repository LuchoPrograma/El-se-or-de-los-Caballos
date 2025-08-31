extends Control

func _ready():
	get_tree().paused = true
	$MusicaMenu.play()
	$Menu.show()
	$Controls.hide()
	$Timer.hide()
	$GameOverScreen.hide()
	$VictoryScreen.hide()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		$Menu.hide()
		$Controls.show()
		$Timer.show()
		$GetReadyText.show()
		get_tree().paused = false
		
	
func game_over():
	get_tree().paused = true
	$Controls.hide()
	$Timer.hide()
	$GameOverScreen.show()
	$VictoryScreen.hide()
