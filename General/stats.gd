class_name Stats extends Node

signal stats_updated

static var instance : Stats
static var _gems : int = 350
static var gems : int:
	get:
		return _gems
	set(value):
		_gems = value
		instance.stats_updated.emit()

func _ready():
	instance = self