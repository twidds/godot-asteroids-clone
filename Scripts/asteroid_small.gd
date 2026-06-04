class_name SmallAsteroid
extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerShip:
		body.hit(self)
		queue_free()
	#will need some way to signal points
