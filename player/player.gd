extends CharacterBody2D

const SPEED = 0
const JUMP_VELOCITY = -200.0



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$AnimationPlayer.play("run")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$AudioStreamPlayer2D.play()
		velocity.y = JUMP_VELOCITY

	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name != 'Floor':
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
