class_name Player
extends Character

func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down").normalized()
	move(delta)
