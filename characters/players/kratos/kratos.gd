@icon("res://assets/1/kratos_picture.png")
extends Player
class_name Kratos

func take_damage(damage: int):
	super(damage)
	$HealthBar.value = hp
	if hp <= 0:
		$StateChart.send_event("dead")
	else:
		$StateChart.send_event("hurt")

func _physics_process(delta):
	super(delta)
	if direction != Vector2.ZERO:
		$AnimationTree.set("parameters/movement/idle/blend_position", direction)
		$AnimationTree.set("parameters/movement/move/blend_position", direction)

	if Input.is_action_just_pressed("debug"):
		take_damage(20)


func _on_afk_state_entered():
	$AnimationTree["parameters/movement/playback"].travel("afk")


func _on_idle_state_entered():
	$AnimationTree["parameters/movement/playback"].travel("idle")


func _on_move_state_entered():
	$AnimationTree["parameters/movement/playback"].travel("move")


func _on_hurt_state_entered():
	$HitFlashAnimationPlayer.play("hurt")


func _on_dead_state_entered():
	queue_free()


func _on_afk_state_physics_processing(_delta):
	if direction != Vector2.ZERO:
		$StateChart.send_event("moving")


func _on_idle_state_physics_processing(_delta):
	if direction != Vector2.ZERO:
		$StateChart.send_event("moving")


func _on_move_state_physics_processing(_delta):
	if direction == Vector2.ZERO:
		$StateChart.send_event("idle")
		$StateChart.send_event("afk")


func _on_hurt_state_physics_processing(_delta):
	if direction == Vector2.ZERO:
		$StateChart.send_event("idle")
		$StateChart.send_event("afk")
	else:
		$StateChart.send_event("moving")



