@icon("res://assets/characters/players/kratos/kratos_picture.png")
extends Player
class_name Kratos

func _physics_process(delta):
	super(delta)
	if direction != Vector2.ZERO:
		update_blend_position()
		
	#if Input.is_action_just_pressed("debug"):
		#take_damage(1)

func update_blend_position() -> void:
		$AnimationTree.set("parameters/idle/blend_position", direction)
		$AnimationTree.set("parameters/move/blend_position", direction)
		$AnimationTree.set("parameters/attack/blend_position", direction)

func take_damage(damage: int) -> void:
	super(damage)
	if hp <= 0:
		$StateChart.send_event("dead")
	else:
		$StateChart.send_event("hurt")
	$HealthBar.value = hp
