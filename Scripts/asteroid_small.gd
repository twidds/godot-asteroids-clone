class_name SmallAsteroid
extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is PlayerShip: #Will need special case for any asteroid types
		queue_free()
	#will need some way to signal points
