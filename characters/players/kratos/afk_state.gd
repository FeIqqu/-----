extends AtomicState

@onready var player: Kratos = $"../../.."
@onready var animation_tree: AnimationTree = $"../../../AnimationTree"

func _on_state_entered():
	animation_tree.set("parameters/movement/transition_request", "afk")


func _on_state_physics_processing(_delta):
	if player.direction != Vector2.ZERO:
		_chart.send_event("moving")

	if Input.is_action_just_pressed("attack"):
		_chart.send_event("attack")
