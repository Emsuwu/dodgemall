extends ButtonAction

@export var animator : AnimationPlayer

func _on_pressed():
	animator.play("home->wardrobe")
