extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$AnimatedSprite2D.play("side_door_closed1")


func _on_body_entered(_body:Node2D):
	
	$AnimatedSprite2D.play("side_door_open1")
	



func _on_body_exited(_body:Node2D):
	$AnimatedSprite2D.play("side_door_closed1")
	
	
