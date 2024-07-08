extends Area2D

func _ready() -> void:
	$AnimatedSprite2D.play("side_door_closed1")


func _on_body_entered(_body: Node2D) -> void:
	$AnimatedSprite2D.play("side_door_open1")


func _on_body_exited(_body: Node2D) -> void:
	$AnimatedSprite2D.play("side_door_closed1")
