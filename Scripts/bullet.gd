class_name Bullet extends Area2D

var damage := 0
var velocity := Vector2.ZERO
var fired_by_ship : PlayerShip

signal bullet_hit(bullet:Bullet, collider:Node2D)
signal bullet_died(bullet:Bullet)

func setup(firing_ship:PlayerShip, pos: Vector2, vel:Vector2, dmg:int, lifetime:float) -> void:
	position = pos
	fired_by_ship = firing_ship
	velocity = vel
	damage = dmg
	
	#Better to just track with a spawn_time variable?
	var life_timer := get_tree().create_timer(lifetime)
	life_timer.timeout.connect(bullet_expired)

func bullet_expired() -> void:
	bullet_died.emit(self)
	queue_free()

func _physics_process(delta: float) -> void:
	position += velocity * delta

func _on_area_entered(_area: Area2D) -> void:
	print("bullet %s hit Area2D" % self.name)
	#If we hit an asteroid, need to set the "last_hit_by" variable to fired_by_ship
