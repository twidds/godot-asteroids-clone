@tool
class_name CircleShape
extends Node2D

@export var radius := 5.0
@export var color:= Color(1.0, 0.5, 0.1, 1.0)

func _ready() -> void:
	pass # Replace with function body.

func _draw() -> void:
	draw_circle(position, radius, color, true)
