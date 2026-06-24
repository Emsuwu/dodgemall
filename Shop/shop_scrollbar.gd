extends HScrollBar

@export var shop_panels : Control

func _ready():
	shop_panels.position.x = 50

func _on_value_changed(v: float):
	shop_panels.position.x = ( shop_panels.width / 100 ) * -v + 50
