class_name Player
extends Character

func _physics_process(_delta):
	direction = Input.get_vector("left", "right", "up", "down").normalized()
