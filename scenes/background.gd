extends Sprite2D

const VELOCITY : float = -1.0
var g_texture_width : float = 0



func _ready():
	g_texture_width = get_region_rect().size.x * scale.x

func _process(delta):
	position.x += VELOCITY
	scroll_background()
	
func scroll_background() -> void:
	if position.x < -g_texture_width:
		position.x += 2 * g_texture_width
