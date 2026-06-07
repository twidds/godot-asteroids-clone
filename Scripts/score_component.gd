class_name ScoreComponent extends Node

var score := 0
signal score_changed(change_amount: int, newscore: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0

func add_score(amount: int):
	score += amount
	score_changed.emit(amount, score)

func subtract_score(amount: int):
	score -= amount
	score_changed.emit(-amount, score)

func reset_score() -> void:
	var amount := -score
	score = 0
	score_changed.emit(amount, score)
