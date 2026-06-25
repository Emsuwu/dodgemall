extends RichTextLabel

func _ready():
	Player.instance.on_game_over.connect(_on_game_over)

func _on_game_over() -> void:
	text = ""

	var score : int = round(Player.score)
	var hiscore : int = round(Stats.hi_score)

	text += "[right]Score: " + str(score) + " \n"
	if Player.new_hiscore: text += "[color=gold][wave]NEW "
	text += "Hi-score: " + str(hiscore) + " "
	if Player.new_hiscore: text += "[/wave]"
