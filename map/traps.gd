extends Area2D

var is_active: bool = true
var trap_damage: int = 10

func _ready() -> void:
	$AnimatedSprite2D.play("active")


func _on_body_entered(body: Node2D) -> void:
	if is_active:
		$GPUParticles2D.restart()
		body.take_damage(trap_damage)
		$AnimatedSprite2D.play("nonactive")
		is_active = false
