extends Node2D

var crate = preload("res://obstacles/crate.tscn")
var rng = RandomNumberGenerator.new()
var is_timer_running : bool = false
var spawn_rate_min = 2.0
var spawn_rate_max = 3.0
var has_difficulty_increased : float = false


func spawn_crate():
	var inst = crate.instantiate()
	inst.position = Vector2(150, 130)
	add_child(inst)

func increase_difficulty():
	if spawn_rate_min > 0.5:
		spawn_rate_min /= randf_range(1, 2)
	if spawn_rate_max > 1:
		spawn_rate_max /= randf_range(1, 2)

func _process(delta):
	if not is_timer_running:
		is_timer_running = true
		var wait_time = rng.randf_range(spawn_rate_min, spawn_rate_max)
		$Timer.wait_time = wait_time
		await $Timer.timeout
		spawn_crate()
		is_timer_running = false
	
	if PlayerData.score > 0:
		if PlayerData.score % 10 == 0 and not has_difficulty_increased:
			has_difficulty_increased = true
			increase_difficulty()
	
