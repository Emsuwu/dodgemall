@icon("res://Player/Skin/trans.svg")
class_name Player
extends Sprite2D
@onready var area_2d: Area2D = $Area2D
@onready var circle: CollisionShape2D = $Area2D/CollisionShape2D

@export var game_over_ui : Control

var velocity: Vector2
const BASE_SPEED : float = 50
const DRAG : float = 0.9
const RATE_OF_SIZE_CHANGE : float = .005

func change_size(amount : float) -> void:
	scale.x += amount
	scale.y += amount
func set_size(size : float) -> void:
	scale.x = size
	scale.y = size
func get_size() -> float:
	return scale.x

func _process(delta) -> void:
	do_debug_keys(delta)
	do_movement(delta)
	gradually_increase_size(delta)

func gradually_increase_size(delta : float) -> void:
	if get_size() >= 0.5: return
	change_size(delta*RATE_OF_SIZE_CHANGE)

func do_movement(delta : float) -> void:
	var dy : float = Input.get_axis("up", "down")
	var dx : float = Input.get_axis("left", "right")

	velocity.x += dx * delta * BASE_SPEED
	velocity.y += dy * delta * BASE_SPEED

	position += velocity
	velocity *= DRAG

	if global_position.x < 0:
		global_position.x = 0
	if global_position.x > 1920:
		global_position.x = 1920
	if global_position.y > 1080:
		global_position.y = 1080
	if global_position.y < 0:
		global_position.y = 0


func do_debug_keys(delta : float) -> void:
	if Input.is_action_pressed("debug_increase_size"):
		change_size(delta)
	if Input.is_action_pressed("debug_decrease_size"):
		set_size(-delta)

func on_death() -> void:
	print("death")
	game_over_ui.appear()
	queue_free()