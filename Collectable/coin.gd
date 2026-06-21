@icon("res://Collectable/Sprites/gold_coin.svg")
class_name Coin extends Node2D

var is_collected : bool

@export var gold_coin : Texture2D
@export var silver_coin : Texture2D
@export var sprite : Sprite2D
@export var plink_sound : AudioStreamPlayer
@export var particles : GPUParticles2D

var direction : float

enum values { SILVER, GOLD }
var _value : values
var value : values:
	get:
		return _value
	set(v):
		set_value(v)

func set_value(v : values):
	if v == values.SILVER:
		sprite.texture = silver_coin
	elif v == values.GOLD:
		sprite.texture = gold_coin

func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("player"):
		on_collect()

func on_collect():
	if is_collected: return
	is_collected = true
	sprite.hide()
	plink_sound.play()
	particles.emitting = true

	if value == values.SILVER:
		Player.score += 15
	if value == values.GOLD:
		Player.score += 30

	await get_tree().create_timer(1).timeout
	queue_free()

func _process(delta):
	position.x += direction * delta * 10