extends CharacterBody2D
class_name PlayerShip
@onready var health_component: HealthComponent = %HealthComponent

func _physics_process(delta: float) -> void:
	pass #Should call into ShipMovement code instead of handling directly there.

func hit(body: Node2D) -> void:
	if body is SmallAsteroid:
		print("Smacked asteroid")
		health_component.damage(1)

func _health_hit_zero() -> void:
	print("you died")
