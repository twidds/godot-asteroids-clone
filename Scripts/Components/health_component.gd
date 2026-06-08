class_name HealthComponent
extends Node

signal health_change(new_health: int, max_health: int)
signal health_hit_zero

@export var max_health := 3
var current_health := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health

func damage(amount: int) -> void:
	if current_health > 0:
		amount = amount if amount <= current_health else current_health
		current_health -= amount
		if current_health == 0:
			health_hit_zero.emit()
		health_change.emit(current_health, max_health)
