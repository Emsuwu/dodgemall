extends Area2D

func _on_area_entered(area: Area2D):
	area.owner.queue_free()