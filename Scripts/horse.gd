extends CharacterBody2D

var is_horse = true
var state = "alive"
signal game_over

func _physics_process(delta: float) -> void:
	if state == "alive":
		velocity.y = 300
	
	if state == "drowned":
		rotation += 0.1
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	state = "drowned"
	$Collision.disabled = true
	$Area2D/CollisionShape2D.disabled = true
	$Area2D.collision_layer = 0
	$Area2D.collision_mask = 0
	collision_mask = 0
	collision_layer = 0
	velocity.y = 0
	if body == $Main/Aguas/ola_idquierda:
		velocity.x = 100
	elif body == $Main/Aguas/ola_derecha:
		velocity.x = -100
	
	$Caballo.play(1)	
		
	await get_tree().create_timer(1).timeout
	emit_signal("game_over")

	queue_free()
		
	
