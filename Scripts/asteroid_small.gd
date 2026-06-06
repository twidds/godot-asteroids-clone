class_name SmallAsteroid
extends Area2D
@onready var health_component: HealthComponent = %HealthComponent
@onready var collider: CollisionShape2D = $Collider
@onready var death_particles: GPUParticles2D = $DeathParticles
@onready var shape: Polygon2D = $Shape

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerShip: #Will need special case for any asteroid types
		health_component.damage(1)
	#will need some way to signal points

func _on_timer_timeout() -> void:
	queue_free()

func _health_hit_zero() -> void:
	collider.disabled = true
	shape.visible = false	
	death_particles.restart()
	
	var timer := Timer.new()
	add_child(timer)
	timer.wait_time = 2
	timer.one_shot = true
	timer.start()
	timer.timeout.connect(_on_timer_timeout)
