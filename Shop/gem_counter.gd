extends RichTextLabel

func _ready():
	_stats_updated()
	Stats.instance.stats_updated.connect(_stats_updated)

func _stats_updated():
	text = "[right][img width=75]res://Collectable/Sprites/gem.svg[/img] "+ str(Stats.gems) +" [/right]"
