extends AtomicState

@onready var player: Kratos = $"../../.."
@onready var hit_flash_animation_player: AnimationPlayer = $"../../../HitFlashAnimationPlayer"

func _on_state_entered():
	hit_flash_animation_player.play("hurt")

func _on_state_physics_processing(_delta):
	if player.direction == Vector2.ZERO:
		_chart.send_event("idle")
		_chart.send_event("afk")
	else:
		_chart.send_event("moving")
