class_name PlayerHurtbox
extends Area2D

@export var health_component: HealthComponent

func _on_area_entered(area: Area2D) -> void:
	if area is SmallAsteroid:
		print("collided with asteroid")
		health_component.damage(1)
