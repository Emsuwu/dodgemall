class_name Stats extends Node

signal stats_updated

static var instance : Stats
static var _hi_score : float
static var hi_score : float:
	get:
		return _hi_score
	set(value):
		_hi_score = value
		instance.stats_updated.emit()

static var _gems : int
static var gems : int:
	get:
		return _gems
	set(value):
		_gems = value
		instance.stats_updated.emit()

func _ready():
	instance = self