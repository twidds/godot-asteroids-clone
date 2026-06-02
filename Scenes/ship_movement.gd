extends Node

#Hooks to drop in the object being controlled
@export var ship : PhysicsBody2D
const ACCEL_RATE := 10 #Pixels/tick^2
const MAX_VELOCITY := 1500.0 #Pixels/tick
const TURN_RATE := 5.0 #Rad/tick?

var velocity: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not ship:
		pass
	
	var turn_direction: = Input.get_axis("p1_move_left","p1_move_right")
	var accel_dir := Input.get_axis("p1_brake","p1_accelerate")
	
	#Turn ship
	var turn_amt: = 0.0
	if accel_dir < 0.0: #point ship oppposite to velocity
		var turn_towards := (velocity * -1).angle()
		var diff := angle_difference(ship.rotation, turn_towards)
		turn_direction = -1.0 if diff < 0.0 else 1.0
		
		turn_amt = TURN_RATE * turn_direction * delta
		if abs(diff) < abs(turn_amt):
			turn_amt = diff
		ship.rotate(turn_amt)
	else: #Turn based on L/R
		turn_amt = turn_direction * TURN_RATE * delta
		ship.rotate(turn_amt)
	
	#Accelerate ship
	if accel_dir >= 0.0:
		var accel := accel_dir * Vector2.from_angle(ship.rotation) * ACCEL_RATE
		velocity += accel
		if velocity.length() > MAX_VELOCITY:
			velocity = velocity.normalized() * MAX_VELOCITY
	
	ship.position += velocity * delta
	print(velocity.length())
