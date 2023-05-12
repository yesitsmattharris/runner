extends Label

var score = PlayerData.score


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Score: %s" % score


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerData.score > score:
		score = PlayerData.score
		text = "Score: %s" % score
