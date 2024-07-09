extends AtomicState

func _on_state_entered():
	queue_free()
