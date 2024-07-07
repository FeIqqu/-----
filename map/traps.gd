extends Area2D
func _ready()->void:
	$AnimatedSprite2D.play("active")
func _on_body_entered(_body: Node2D) -> void:
	while($AnimatedSprite2D.animation==("active")):
		if(_body.name=="Kratos"):
			$GPUParticles2D.emitting = true
			$AnimatedSprite2D.play("nonactive")
		else:
			$GPUParticles2D.emitting = false

		
	
		
		
	
	
	



