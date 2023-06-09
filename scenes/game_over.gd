extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Main/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Score.text = "Score: %s" % PlayerData.score
	get_parent().get_node("AudioStreamPlayer2D").play()

func _on_button_play_pressed():
	PlayerData.score = 0
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_button_quit_pressed():
	get_tree().quit()
