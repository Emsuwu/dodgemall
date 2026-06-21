extends RichTextLabel

var legendary : String = "#f5cb33"
var epic : String = "#c133f5"
var rare : String = "#f53333"
var uncommon : String = "#00b67c"
var common : String = "#ffffff"

func _process(delta):

	var text_color : String
	if Player.score >= 1000:
		text_color = legendary
	elif Player.score >= 500:
		text_color = epic
	elif Player.score >= 250:
		text_color = rare
	elif Player.score >= 100:
		text_color = uncommon
	else:
		text_color = common

	text = "[center][color=" + text_color + "]" + str( int ( roundf( Player.score ) ) ) + "[/color][/center]"