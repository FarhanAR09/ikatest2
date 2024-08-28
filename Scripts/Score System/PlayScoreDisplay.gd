class_name PlayScoreDisplay extends Label

@export var scoreTracker : ScoreTracker

func _ready():
    if scoreTracker != null:
        scoreTracker.onScoreUpdated.connect(_UpdateDisplay)
    else : prints("WARNING: No score tracker set on ", name)

    _UpdateDisplay(0)

func _exit_tree():
    if scoreTracker != null:
        scoreTracker.onScoreUpdated.disconnect(_UpdateDisplay)
    else : prints("WARNING: No score tracker set on ", name)

func _UpdateDisplay(score : int):
    text = "SCORE: " + str(score)