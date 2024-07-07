extends Area2D
var is_active:bool = true
var trap_damage:int = 10
func _ready()->void:
	$AnimatedSprite2D.play("active")
func _on_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("player") and is_active:
		$GPUParticles2D.emitting = true
		body.take_damage(trap_damage)
		$AnimatedSprite2D.play("nonactive")
		is_active = false
		
	
	
func _on_body_exited(_body:Node2D):
	$GPUParticles2D.emitting = false
