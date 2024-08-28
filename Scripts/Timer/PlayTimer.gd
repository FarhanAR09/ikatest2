class_name PlayTimer extends Timer

signal playTimeout
signal updateTimer(timeLeft : float)

@export var playDuration : float = 60.0

var _lastTime : float = 0.0

func _ready():
    timeout.connect(_EmitTimeout)

    start(playDuration)
    _lastTime = time_left

func _exit_tree():
    timeout.disconnect(_EmitTimeout)

func _process(_delta):
    if _lastTime != time_left:
        _lastTime = time_left
        updateTimer.emit(time_left)

func _EmitTimeout():
    playTimeout.emit()