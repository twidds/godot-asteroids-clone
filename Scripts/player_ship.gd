class_name PlayerShip extends CharacterBody2D

@onready var health_component: HealthComponent = %HealthComponent
@onready var ship_movement: MovementComponent = $MovementComponent
@onready var score_component: ScoreComponent = $ScoreComponent
@onready var weapon_component: WeaponComponent = $WeaponComponent

func _physics_process(delta: float) -> void:
	var turn_direction: = Input.get_axis("p1_move_left","p1_move_right")
	var accel_dir := Input.get_axis("p1_brake","p1_accelerate")
	var fire_pressed := Input.is_action_pressed("p1_fire")
	
	ship_movement.move_ship(delta, turn_direction, accel_dir)
	
	if fire_pressed:
		var facing := Vector2.from_angle(transform.get_rotation())
		var v_ship := ship_movement.velocity
		weapon_component.fire_weapon(self, facing, v_ship)

func _health_hit_zero() -> void:
	print("you died")
