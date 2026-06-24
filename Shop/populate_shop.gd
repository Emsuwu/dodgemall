extends Control

@export var shop_item_panel : PackedScene
var width : float

func _ready():
	var all_skins : Array = Skins.skins.keys()

	for i in range(all_skins.size()):
		var new_item_panel : ShopItemPanel = shop_item_panel.instantiate()
		new_item_panel.position.x = 650 * i
		new_item_panel.set_item(all_skins[i])
		add_child(new_item_panel)

	width = all_skins.size() * 650