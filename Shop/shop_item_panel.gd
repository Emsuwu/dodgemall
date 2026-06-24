class_name ShopItemPanel extends Control

var icon_name : String
@export_group("References")
@export var icon : Panel
@export var description : RichTextLabel
@export var price : RichTextLabel

# func _ready():
# 	if icon_name != "":
# 		set_item(icon_name)

func set_item(item : String):
	icon_name = item
	var new_style : StyleBoxTexture = StyleBoxTexture.new()
	new_style.texture = Skins.skins[item]["icon"]
	icon.add_theme_stylebox_override("panel", new_style)
	description.text = "[center]" + Skins.skins[item]["description"] + "[/center]"
	price.text = "[center][img width=50]res://Collectable/Sprites/gem.svg[/img]" + str(Skins.skins[item]["price"]) + "[/center]"
