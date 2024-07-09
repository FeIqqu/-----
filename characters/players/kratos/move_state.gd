extends AtomicState

@onready var player: Kratos = $"../../.."
@onready var animation_tree: AnimationTree = $"../../../AnimationTree"

func _on_state_entered():
	player.move(1.0)
	animation_tree.set("parameters/movement/transition_request", "move")


func _on_state_physics_processing(delta):
	player.move(delta)

	if player.direction == Vector2.ZERO:
		_chart.send_event("idle")
		_chart.send_event("afk")

	if Input.is_action_just_pressed("attack"):
		_chart.send_event("attack")
