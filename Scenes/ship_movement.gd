extends Node

#Hooks to drop in the object being controlled
@export var ship : PhysicsBody2D
const ACCEL_RATE := 10 #Pixels/tick^2
const MAX_VELOCITY := 5000.0 #Pixels/tick
const TURN_RATE := 5.0 #Rad/tick?

var velocity: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not ship:
		pass
	
	var turn_direction = Input.get_axis("p1_move_left","p1_move_right")
	var accel_dir = Input.get_axis("p1_accelerate","p1_brake")
	
	#Turn ship
	var turn_amt = turn_direction * TURN_RATE * delta
	ship.rotate(turn_amt)
	
	#Accelerate ship
	var accel = Vector2.ZERO
	var ship_pointing = Vector2.from_angle(ship.rotation).rotated(PI/2)
	if accel_dir > 0.0: #braking turn
		var turn_towards := (velocity).angle()
		var diff := angle_difference(turn_towards, ship_pointing.angle())
		
		
		print(diff)
		turn_direction = 1.0 if diff < 0.0 else -1.0
		
		if abs(diff) < TURN_RATE * delta:
			turn_amt = abs(diff) * turn_direction * delta
		else:
			turn_amt = TURN_RATE * turn_direction * delta
		ship.rotate(turn_amt)
	else:
		accel = accel_dir * ship_pointing * ACCEL_RATE
	
	velocity += accel
	if velocity.length() > MAX_VELOCITY:
		velocity = velocity.normalized() * MAX_VELOCITY
	ship.position += velocity * delta
