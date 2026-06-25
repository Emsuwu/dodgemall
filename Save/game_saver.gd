extends Node

signal loaded_savedata

const SAVE_PATH := "user://save.tres"
var savedata: SaveData = null

func _ready() -> void:
	load_data()
	if savedata.selected_skin!="": Player.set_current_icon(savedata.selected_skin)

func load_data() -> void:
	if ResourceLoader.exists(SAVE_PATH):
		savedata = ResourceLoader.load(SAVE_PATH, "", ResourceLoader.CACHE_MODE_IGNORE)
		Skins.purchased_skins = savedata.unlocked_skins
		statistics.gems = savedata.gems
		statistics.hi_score = savedata.hi_score
		loaded_savedata.emit()
	else:
		savedata.selected_skin = "default"
		savedata = SaveData.new()

func erase_data() -> void:
	savedata = SaveData.new()
	save()

func save() -> void:

	savedata.gems = statistics.gems
	savedata.hi_score = round(statistics.hi_score)
	savedata.unlocked_skins = Skins.purchased_skins

	var error_code := ResourceSaver.save(savedata, SAVE_PATH)
	if error_code != OK:
		push_error("Failed to save game: " + error_string(error_code))