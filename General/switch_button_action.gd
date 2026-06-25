class_name SwitchSceneButtonAction extends ButtonAction

@export var scene_name : String

func _on_pressed():
	get_tree().change_scene_to_file(scene_name)