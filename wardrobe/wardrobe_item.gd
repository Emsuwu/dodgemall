class_name WardrobeItem extends Control

@export var icon : TextureRect
var item_name : String

func set_item(icon_name : String):
	icon.texture = Skins.get_icon(icon_name)
	item_name = icon_name