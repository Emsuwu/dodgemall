class_name Skins extends Node

static var purchased_skins : Array[String] = ["default"]

static func unlock_all_skins() -> void:
	Skins.purchased_skins.clear()
	for skin : String in Skins.skins.keys():
		Skins.purchased_skins.append(skin)

static func get_icon(icon_name : String):
	print(typeof(skins[icon_name]["icon"]))
	return skins[icon_name]["icon"]

static var skins : Dictionary[String, Dictionary] = {
	"default" : {
		"price" : 0,
		"description" : "Bog standard ball",
		"icon": load("res://Player/Skin/default.svg")},
	"asexual" : {
		"price" : 25,
		"description" : "That's ace",
		"icon": load("res://Player/Skin/asexual.svg")},
	"bisexual" : {
		"price" : 25,
		"description" : "Bisexual icon",
		"icon": load("res://Player/Skin/bisexual.svg")},
	"gay_male" : {
		"price" : 25,
		"description" : "Gay men's icon",
		"icon": load("res://Player/Skin/gay_male.svg")},
	"genderfluid" : {
		"price" : 25,
		"description" : "Genderfluid icon",
		"icon": load("res://Player/Skin/genderfluid.svg")},
	"lesbian" : {
		"price" : 25,
		"description" : "Lesbian icon",
		"icon": load("res://Player/Skin/lesbian.svg")},
	"nonbinary" : {
		"price" : 25,
		"description" : "Nonbinary icon",
		"icon": load("res://Player/Skin/nonbinary.svg")},
	"pansexual" : {
		"price" : 25,
		"description" : "Pansexual icon",
		"icon": load("res://Player/Skin/pansexual.svg")},
	"queer" : {
		"price" : 25,
		"description" : "Queer icon",
		"icon": load("res://Player/Skin/queer.svg")},
	"trans" : {
		"price" : 25,
		"description" : "Trans icon",
		"icon": load("res://Player/Skin/trans.svg")},
	"pirate" : {
		"price" : 50,
		"description" : "Piracy is cool",
		"icon": load("res://Player/Skin/pirate.svg")},
	"lashes" : {
		"price" : 50,
		"description" : "lashes",
		"icon": load("res://Player/Skin/lashes.svg")},
	"mystery" : {
		"price" : 50,
		"description" : "really mysterious black hole bal what is it hiding??? we may never know but we can guess at least. does it suck?",
		"icon": load("res://Player/Skin/mystery.svg")},
	"patricia" : {
		"price" : 75,
		"description" : "patricia",
		"icon": load("res://Player/Skin/patricia.svg")},
	"patrick" : {
		"price" : 75,
		"description" : "patricia but green",
		"icon": load("res://Player/Skin/patrick.svg")},
	"dot_consumer" : {
		"price" : 75,
		"description" : "non-copyright infringing yellow chomper",
		"icon": load("res://Player/Skin/dot_consumer.svg")},
	"taco" : {
		"price" : 100,
		"description" : "yummy taco",
		"icon": load("res://Player/Skin/taco.svg")},
}