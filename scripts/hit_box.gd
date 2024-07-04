class_name HitBox
extends Area2D

@export var damage: int = 10

func _init() -> void:
	collision_layer = 5
	collision_mask = 0
