extends HSlider
var music_bus = AudioServer.get_bus_index("Music")

@export var music : AudioStreamPlayer
@export var music_animator : AnimationPlayer

func _ready():
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))
	GameSaver.loaded_savedata.connect(_loaded_savedata)

func _loaded_savedata() -> void:
	print("awdj")
	value = GameSaver.savedata.music_volume
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))


func _on_drag_ended(value_changed: bool):
	print("asfjmaepofjkaewsopfjaoepwf")
	print(value)
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))
	GameSaver.savedata.music_volume = value
	GameSaver.save()
	music.stop()

func _process(_delta: float) -> void:
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))

func _on_drag_started():
	if !music.playing:
		music_animator.play("RESET")
		music.play()
