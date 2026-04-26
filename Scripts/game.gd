extends Node2D

const enemy_scene = preload("res://Scenes/enemy.tscn")

@onready var level_up_screen = $levelupscreen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#level_up_screen = level_up_scene.instantiate()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()	
	add_child(enemy)

	var enemy_spawn_location = $enemy_path/enemy_spawn_location
	enemy_spawn_location.progress_ratio = randf()
	
	enemy.position = enemy_spawn_location.position + $Player.position
	
	enemy.velocity = enemy.enemy_speed * ($Player.position - enemy.position).normalized()


func _on_player_level_up() -> void:
	get_tree().paused = true
	level_up_screen.show()


func _on_levelupscreen_stats_up(stat: String) -> void:
	get_tree().paused = false
	level_up_screen.hide()
