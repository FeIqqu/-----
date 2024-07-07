extends Area2D


func _ready()->void:
	$AnimatedSprite2D.play("front_door_closed1")
	$AnimatedSprite2D2.play("front_door_closed2")
	
	

func _on_body_entered(_body:Node2D):
	$AnimatedSprite2D.play("front_door_open1")
	$AnimatedSprite2D2.play("front_door_open2")
	
	
	


func _on_body_exited(_body:Node2D):
	$AnimatedSprite2D.play("front_door_closed1")
	$AnimatedSprite2D2.play("front_door_closed2")
