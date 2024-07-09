extends AtomicState

var is_attack_animation_playing: bool

@onready var player: Kratos = $"../../.."
@onready var animation_player: AnimationPlayer = $"../../../AnimationPlayer"
@onready var animation_tree: AnimationTree = $"../../../AnimationTree"
	
func _on_state_entered():
	player.set_physics_process(false)
	is_attack_animation_playing = true
	animation_tree.set("parameters/in_attacking/transition_request", "attacking")


func _on_state_physics_processing(_delta):
	#if Input.is_action_just_pressed("debug"):
		#player.take_damage(1)
	if not is_attack_animation_playing:
		if player.direction == Vector2.ZERO:
			_chart.send_event("idle")
			_chart.send_event("afk")
		else:
			_chart.send_event("moving")


func _on_state_exited():
	animation_finished()
	animation_tree.set("parameters/in_attacking/transition_request", "not_attacking")


func animation_finished() -> void:
	player.set_physics_process(true)
	is_attack_animation_playing = false
