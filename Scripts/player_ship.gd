extends CharacterBody2D
class_name PlayerShip

@onready var health_component: HealthComponent = %HealthComponent
@onready var ship_movement: Node = $ShipMovement
@onready var score_component: ScoreComponent = $ScoreComponent

func _physics_process(delta: float) -> void:
	var turn_direction: = Input.get_axis("p1_move_left","p1_move_right")
	var accel_dir := Input.get_axis("p1_brake","p1_accelerate")
	ship_movement.move_ship(delta, turn_direction, accel_dir)

func hit(collider: Node2D) -> void:
	if collider is SmallAsteroid:
		print("Smacked asteroid")
		health_component.damage(1)

func _health_hit_zero() -> void:
	print("you died")
