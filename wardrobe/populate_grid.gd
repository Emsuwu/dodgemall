extends GridContainer

@export var wardrobe_item : PackedScene

func _ready() -> void:
	populate()

func populate():
	for child in get_children():
		if not child is WardrobeItem: 
			continue
		child.queue_free()

	for i in range(Skins.skins.keys().size()):
		var skin : String = Skins.skins.keys()[i]
		if not skin in Skins.purchased_skins: 
			continue
		var new_wardrobe_item : WardrobeItem = wardrobe_item.instantiate()
		new_wardrobe_item.set_item(skin)
		add_child(new_wardrobe_item)

func _process(_delta) -> void:
	if Input.is_action_just_pressed("debug_decrease_size"):
		Skins.unlock_all_skins()
		populate()
	
