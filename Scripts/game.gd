extends Node2D

const enemy_scene = preload("res://Scenes/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()	
	add_child(enemy)

	var enemy_spawn_location = $enemy_path/enemy_spawn_location
	enemy_spawn_location.progress_ratio = randf()
	
	enemy.position = enemy_spawn_location.position
	
	enemy.velocity = enemy.enemy_speed * ($Player.position - enemy.position).normalized()
