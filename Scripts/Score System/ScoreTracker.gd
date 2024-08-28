class_name ScoreTracker extends Node

@export var scoreManager : ScoreManager

signal onScoreUpdated(score: int)

var _score : int = 0
var score : int :
	get : return _score
	

func _ready():
	if scoreManager != null :
		scoreManager.onScoreAdditionRequested.connect(_AddScore)

func _exit_tree():
	if scoreManager != null :
		scoreManager.onScoreAdditionRequested.disconnect(_AddScore)

func _AddScore(amount : int):
	_score += amount
	onScoreUpdated.emit(score)