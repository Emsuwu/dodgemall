@icon("res://audio_randomizer_icon.svg")
class_name AudioStreamRandom extends AudioStreamPlayer

@export var audio_clips : Array[AudioStream]
@export_group("Modulate")
@export_range(0,2.0) var min_pitch : float
@export_range(0,2.0) var max_pitch : float

func play_random(from_position: float = 0.0):
	
	pitch_scale = randf_range(min_pitch, max_pitch)
	stream = audio_clips[randi_range(0, audio_clips.size()-1)]
	
	play(from_position)