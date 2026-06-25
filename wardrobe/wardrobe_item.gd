class_name WardrobeItem extends Control

@export var icon : TextureRect
var item_name : String

func set_item(icon_name : String):
	icon.texture = Skins.get_icon(icon_name)
	item_name = icon_name

func _on_button_button_down():
	Player.set_current_icon(item_name)
