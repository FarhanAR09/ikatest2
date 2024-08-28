class_name SFXManager extends Node

@export var sfxPlayersCount : int = 10

@onready var sfxPlayerScene = preload("res://Scenes/Objects/sfx_player.tscn")
var sfxPlayers : Array[SFXPlayer]

func _ready():
	for i in sfxPlayersCount:
		var inst = sfxPlayerScene.instantiate()
		sfxPlayers.append(inst)
		add_child(inst)

func PlaySFX(sfx: AudioStream, priority : int):
	for sfxPlayer in sfxPlayers:
		if sfxPlayer.TryPlaySFX(sfx, priority):
			return
