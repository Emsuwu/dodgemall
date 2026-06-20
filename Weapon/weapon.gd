@icon("res://Weapon/Sprites/shuriken_gold.svg")
class_name Weapon extends Node2D

@export var direction : float = 0

func spin_left() -> void:
	direction = -50
func spin_right() -> void:
	direction = 50

func _ready():
	$Area2D.connect("area_entered", _on_area_2d_area_entered)

	var ran_size : float = randf_range(.4,1.25)
	scale.x = ran_size
	scale.y = ran_size

func _process(delta):
	rotate(direction*delta*0.05)
	position.x += direction * delta * 10

func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("player"):
		area.owner.on_death()
