extends Node2D

@export_range(0.05, 5) var min_spawn_rate : float
@export_range(0.05, 5) var max_spawn_rate : float

@export_group("Spawnables")
@export var weapons : Array[PackedScene]
@export var coin : PackedScene

@export_group("References")
@export var spawn_top_left : Node2D
@export var spawn_top_right : Node2D
@export var spawn_timer : Timer

var spawn_points_x : Array[float]

func _ready():
	spawn_timer.start()
	spawn_points_x = [spawn_top_left.global_position.x, spawn_top_right.global_position.x]

func _process(delta):

	if Player.score > 400:
		min_spawn_rate = 0.1
		max_spawn_rate = 0.3

	elif Player.score > 200:
		min_spawn_rate = 0.1
		max_spawn_rate = 0.35

	elif Player.score > 100:
		min_spawn_rate = 0.15
		max_spawn_rate = 0.4

	elif Player.score > 50:
		min_spawn_rate = 0.2
		max_spawn_rate = 0.5

func _on_timer_timeout():
	spawn_timer.wait_time = randf_range(min_spawn_rate, max_spawn_rate)
	spawn_timer.start()
	spawn_weapon()
	if randi_range(1,8) == 1:
		spawn_coin()

func spawn_weapon():
	var spawn_x: float = spawn_points_x[randi() % spawn_points_x.size()]
	var spawn_y: float = randf_range(spawn_top_left.global_position.y, spawn_top_right.global_position.y)

	var new_weapon : Weapon = weapons[randi() % weapons.size()].instantiate()
	new_weapon.global_position.x = spawn_x
	new_weapon.global_position.y = spawn_y
	new_weapon.direction = 50 * ( 1 if randi_range(0,1)==0 else -1 )
	add_child(new_weapon)

func spawn_coin():
	var spawn_x: float = spawn_points_x[randi() % spawn_points_x.size()]
	var spawn_y: float = randf_range(spawn_top_left.global_position.y, spawn_top_right.global_position.y)

	var new_coin : Node2D = coin.instantiate()
	new_coin.global_position.x = spawn_x
	new_coin.global_position.y = spawn_y
	new_coin.direction = 50 * ( 1 if randi_range(0,1)==0 else -1 )
	if randi_range(1,5) == 1:
		new_coin.value = Coin.values.GOLD
	else:
		new_coin.value = Coin.values.SILVER
	add_child(new_coin)