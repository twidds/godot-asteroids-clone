class_name WeaponComponent extends Node2D

#Things to add:
#	Secondary/special weapons

@export var weapon_scene : PackedScene

var bullet_container : Node #acts as parent for any bullets spawned by weapons
var weapon : ShipWeapon = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bullet_container = Node.new()
	add_child(bullet_container)
	if weapon_scene:
		switch_weapon(weapon_scene)

func switch_weapon(new_weapon:PackedScene):
	if weapon:
		weapon.queue_free()
	weapon = new_weapon.instantiate()
	add_child(weapon)

func fire_weapon(bullet_owner: PlayerShip, facing: Vector2, v_ship:Vector2) -> bool:
	var fired := false
	if weapon:
		
		fired = weapon.fire(facing, v_ship, global_position, bullet_container, bullet_owner)
	return fired
