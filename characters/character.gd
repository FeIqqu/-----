class_name Character
extends CharacterBody2D

@export var max_speed: int = 200 # Максимальная скорость
@export var acceleration: int = 1500 # Ускорение
@export var friction: int = 1000 # Трение

@export var max_hp: int = 100
@export var hp: int = max_hp
@export var armor: int = 0 # Процентное снижение урона (0-100)

var direction: Vector2 = Vector2.ZERO # Направление движения

func move(delta: float) -> void:
	if direction:
		velocity = velocity.move_toward(direction * max_speed, delta * acceleration)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta * friction)
		
	move_and_slide()


func take_damage(damage: int) -> void:
	hp -= damage - (damage * int(armor / 100.0))
