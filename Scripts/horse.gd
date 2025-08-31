extends CharacterBody2D

var state = "alive"

func _physics_process(delta: float) -> void:
	if state == "alive":
		velocity.y = 100
	
	if state == "drowned":
		rotation += 0.1
		

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	state = "drowned"
	$CollisionShape2D.disabled = true
	velocity.y = 0
	print()
	if body == $Main/Aguas/ola_idquierda:
		
		velocity.x = 100
		
	elif body == $Main/Aguas/ola_derecha:
		velocity.x = -100
	else:
		print("wrong nodes b")
		
	await get_tree().create_timer(1).timeout
	queue_free()
		
	
