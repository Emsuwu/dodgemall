extends RichTextLabel

func _ready():
	Player.instance.on_game_over.connect(_on_game_over)

func _on_game_over() -> void:
	text = ""

	var added_gems : int = 0
	var rank : String

	added_gems = round(Player.score / 7)

	if Player.score > 1000:
		rank = "S"

		if Player.score >= 1500:
			for i in range( int(round( (Player.score-1000)/500 ) ) ):
				rank+="+"

	elif Player.score > 800:
		rank = "A"
	elif Player.score > 500:
		rank = "B"
	elif Player.score > 200:
		rank = "C"
	elif Player.score > 100:
		rank = "D"
	elif Player.score > 50:
		rank = "D-"
	else:
		rank = "F"

	Stats.gems += added_gems

	text += " [img width=90]res://Collectable/Sprites/gem.svg[/img] +" + str(added_gems) + " ("+ str(Stats.gems) +") "
	text += "\n [img width=90]res://Collectable/Sprites/gold_coin.svg[/img] " + rank + " Rank"
