@icon("res://Player/Skin/trans.svg")
class_name Player extends Node2D

@export_group("References")
@export var death_area : Area2D
@export var death_area_shape : CollisionShape2D
@export var game_over_ui : Control
@export var death_particles : GPUParticles2D
@export var sprite : Sprite2D
@export var graze_sound : AudioStreamRandom
@export var graze_sprite : Sprite2D
@export var graze_animator : AnimationPlayer

signal on_game_over

static var current_skin_name : String
static var current_icon = null
static var new_hiscore : bool
static var score : float
static var instance : Player

var is_dead : bool
var velocity: Vector2
const BASE_SPEED : float = 60
const DRAG : float = 0.9
const RATE_OF_SIZE_CHANGE : float = .01

func _init():
	instance = self

static func set_current_icon(icon : String) -> void:
	current_skin_name = icon
	current_icon = Skins.get_icon(icon)
	GameSaver.savedata.selected_skin = current_skin_name
	GameSaver.save()

func _ready():
	if current_icon == null:
		current_icon = Skins.default_icon
	new_hiscore = false
	score = 0
	sprite.texture = current_icon

func change_size(amount : float) -> void:
	scale.x += amount
	scale.y += amount
func set_size(size : float) -> void:
	scale.x = size
	scale.y = size
func get_size() -> float:
	return scale.x

func _process(delta) -> void:
	if is_dead: return
	do_debug_keys(delta)
	do_movement(delta)
	gradually_increase_size(delta)
	score += delta

	if Input.is_action_just_pressed("debug_increase_score"):
		score += 100
	if Input.is_action_just_pressed("debug_decrease_score"):
		score -= 100

func gradually_increase_size(delta : float) -> void:
	if get_size() >= 2: return
	change_size(delta * RATE_OF_SIZE_CHANGE)

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
	if is_dead: return
	score -= 5
	if Stats.hi_score <= score:
		Stats.hi_score = score
		new_hiscore = true
	on_game_over.emit()
	
	sprite.hide()
	print("death")
	is_dead = true
	game_over_ui.appear()
	#modulate = Color(0,0,0,0)
	death_particles.emitting = true
	await get_tree().create_timer(1).timeout
	queue_free()

func on_graze() -> void:
	score += 5
	graze_sound.play_random()
	graze_animator.play("graze")
