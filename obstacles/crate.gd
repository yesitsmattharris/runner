extends AnimatableBody2D

const VELOCITY : float = 1.5
const MOVE_VECTOR := Vector2(-100, 0)


func _physics_process(delta):
	# Why is this choppy?
	position.x -= VELOCITY
	if (position.x < -5):
		queue_free()
		PlayerData.increment_score()
