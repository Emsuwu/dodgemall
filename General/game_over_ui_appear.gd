extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var death_messages : Array[String] = []

@export_group("References")
@export var death_message : RichTextLabel
@export var music : AudioStreamPlayer
@export var music_animator : AnimationPlayer

func appear():
	show()
	music_animator.play("fade_out_music")
	animation_player.play("game_over_pop_in")

	effects()

func effects() -> void:
	var text: String = death_messages[randi_range(0, death_messages.size()-1)]
	death_message.text = "[center]" + text + "[/center]"

	if text == "wahwahwahwawawa":
		GameOverAudio.instance.wahwahwahwah()
	else:
		GameOverAudio.instance.play()

func _on_retry_button_down():
	get_tree().reload_current_scene()
