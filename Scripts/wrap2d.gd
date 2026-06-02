#Inspired by: https://www.youtube.com/watch?v=dHk1J12MUYE
#	Repo: https://github.com/guladam/godot_components_course/blob/main/components/wrap_2d.gd
extends Node
class_name Wrap2D

@export var target : PhysicsBody2D = get_parent()
@export var margin: float = 30.0
var screen_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport().get_visible_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if not target:
		print("no target")
		return
	target.transform.origin = wrap_position(target.transform.origin)	#blah

#Would be better to get the camera rectangle instead...
#Modifies in place
func wrap_position(pos : Vector2) -> Vector2:
	pos.x = wrapf(pos.x, -margin, screen_size.x + margin)
	pos.y = wrapf(pos.y, -margin, screen_size.y + margin)
	return pos
