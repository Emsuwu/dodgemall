extends Node2D

@export_range(0.05, 5) var min_spawn_rate : float
@export_range(0.05, 5) var max_spawn_rate : float

@export_group("Weapons")
@export var weapons : Array[PackedScene]

@export_group("References")
@export var spawn_top_left : Node2D
@export var spawn_top_right : Node2D
@export var spawn_timer : Timer

var spawn_points_x : Array[float]

func _ready():
	spawn_timer.start()
	spawn_points_x = [spawn_top_left.global_position.x, spawn_top_right.global_position.x]

func _on_timer_timeout():
	spawn_timer.wait_time = randf_range(min_spawn_rate, max_spawn_rate)
	spawn_timer.start()
	spawn_weapon()

func spawn_weapon():
	var spawn_x: float = spawn_points_x[randi() % spawn_points_x.size()]
	var spawn_y: float = randf_range(spawn_top_left.global_position.y, spawn_top_right.global_position.y)

	var new_weapon : Weapon = weapons[randi() % weapons.size()].instantiate()
	new_weapon.global_position.x = spawn_x
	new_weapon.global_position.y = spawn_y
	new_weapon.direction = 50 * ( 1 if randi_range(0,1)==0 else -1 )
	add_child(new_weapon)