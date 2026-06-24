extends ButtonAction

@export var root : ShopItemPanel
@export var kaching : AudioStreamPlayer
@export var fail_purchase_sound : AudioStreamPlayer
@export var animator : AnimationPlayer
var is_purchased : bool

func _ready():
	check_if_purchased()

func check_if_purchased() -> void:
	if root.icon_name in Skins.purchased_skins:
		print("Purchased")
		set_as_purchased()

func _on_pressed():
	if is_purchased: return
	if Stats.gems >= Skins.skins[root.icon_name]["price"]:
		Stats.gems -= Skins.skins[root.icon_name]["price"]
		kaching.play()
		animator.play("Purchase")
		Skins.purchased_skins.append(root.icon_name)
		set_as_purchased()
	else:
		fail_purchase()

func fail_purchase():
	fail_purchase_sound.play()
	animator.stop()
	animator.play("FailPurchase")

func set_as_purchased() -> void:
	is_purchased = true
	get_parent().disabled = true
	get_parent().text = "Owned"
	
