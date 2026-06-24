extends Button

@export var hover_pop : AudioStreamPlayer
var tween : Tween
var hovered : bool


func _ready():
	connect("button_down", _on_pressed)

func _on_pressed() -> void:
	for child in get_children():
		if child is ButtonAction:
			child._on_pressed()

func _process(_delta):
	if is_hovered():
		if !hovered && !disabled:
			do_hover_effect()
		if disabled:
			do_unhover_effect()
	else:
		if hovered == true:
			do_unhover_effect()

func do_hover_effect() -> void:
	hovered = true
	hover_pop.play_pop()
	var rot_amount : float = randf_range(1.1, 3)
	if randi_range(0, 1) == 0: rot_amount *= -1
	if tween: tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.set_parallel()
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), .4)
	tween.tween_property(self, "rotation_degrees", rot_amount, .4)
func do_unhover_effect() -> void:
	hovered = false
	if tween: tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.set_parallel()
	tween.tween_property(self, "scale", Vector2(1, 1), .2)
	tween.tween_property(self, "rotation_degrees", 0, .2)
