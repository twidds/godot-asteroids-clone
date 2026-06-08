class_name ShipWeapon extends Node2D

#Things to add/polish:
#	ammo handling
#	weapon models
#	support for hitscan weapons

@export var weapon_component : WeaponComponent
@export var bullet_scene: PackedScene
@export var cooldown := 0.25

@export var damage:=1
@export var bullet_speed := 500.0
@export var bullet_lifetime := 5.0

var cooldown_timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cooldown_timer = Timer.new()
	cooldown_timer.one_shot = true
	cooldown_timer.wait_time = cooldown
	add_child(cooldown_timer)

func fire(direction:Vector2, v_ship:Vector2, pos: Vector2, bullet_container:Node, bullet_owner:PlayerShip) -> bool:
	if not cooldown_timer.is_stopped():
		return false
	
	#spawn bullet
	var bullet : Bullet = bullet_scene.instantiate()
	var velocity := direction.normalized() * bullet_speed + v_ship
	print(direction)
	bullet_container.add_child(bullet)
	bullet.setup(bullet_owner, pos, velocity, damage, bullet_lifetime)
	
	#start cooldown
	cooldown_timer.start()
	return true
