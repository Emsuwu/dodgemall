class_name GameOverAudio extends AudioStreamPlayer

@export var _wahwahwahwah : AudioStream

static var instance : GameOverAudio

func _ready():
	instance = self

func wahwahwahwah() -> void:
	stream = _wahwahwahwah
	play()
