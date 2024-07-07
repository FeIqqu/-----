@icon("res://assets/1/hero1.png")
extends Player
class_name Kratos

func _physics_process(delta):
	super(delta)
	if direction != Vector2.ZERO:
		$AnimationTree.set("parameters/StateMachine/idle/blend_position", direction)
		$AnimationTree.set("parameters/StateMachine/move/blend_position", direction)


func _on_afk_state_entered():
	$AnimationTree["parameters/StateMachine/playback"].travel("afk")


func _on_idle_state_entered():
	$AnimationTree["parameters/StateMachine/playback"].travel("idle")


func _on_move_state_entered():
	$AnimationTree["parameters/StateMachine/playback"].travel("move")


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
