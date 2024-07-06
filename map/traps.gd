extends Area2D
func _ready()->void:
	$AnimatedSprite2D.play("active")
func _on_body_entered(_body: Node2D) -> void:
	$AnimatedSprite2D.play("nonactive")
	
