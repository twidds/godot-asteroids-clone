extends Node2D

@export var player: PlayerShip
@onready var health_label: Label = $GridContainer/Health
@onready var score_label: Label = $GridContainer/Score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if player:
		health_label.text = str(player.health_component.current_health)
		player.health_component.health_change.connect(update_health)
		
		score_label.text = str(player.score_component.score)
		player.score_component.score_changed.connect(update_score)
		

func update_health(new_health:int, _max_health:int) -> void:
	health_label.text = str(new_health)

func update_score(_change_amt:int, new_score) -> void:
	score_label.text = str(new_score)
