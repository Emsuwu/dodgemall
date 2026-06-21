extends Area2D



func _on_area_entered(area: Area2D):
	if area.owner is Coin:
		print("Coin")
	area.owner.queue_free()