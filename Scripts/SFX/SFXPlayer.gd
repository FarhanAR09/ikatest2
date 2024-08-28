class_name SFXPlayer extends AudioStreamPlayer2D

var _priority : int = 0

func TryPlaySFX(sfx : AudioStream, priority : int) -> bool:
	if priority >= _priority :
		_priority = priority
		stream = sfx
		play()
		return true
	return false
