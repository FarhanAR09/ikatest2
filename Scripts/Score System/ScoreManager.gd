class_name ScoreManager extends Node

signal onScoreAdditionRequested(amount : int)

func AddScore(amount : int):
    onScoreAdditionRequested.emit(amount)