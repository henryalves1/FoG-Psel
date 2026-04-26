extends CharacterBody2D



@export var enemy_max_hit_points = 10
@export var enemy_speed = 300
var player = null
var current_hp


func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	current_hp = enemy_max_hit_points

func _physics_process(delta: float) -> void:
	velocity = enemy_speed * (player.global_position - global_position).normalized()
	move_and_slide()


func _on_hitbox_collided_with_bullet() -> void:
	current_hp -= 1
	if current_hp <= 0:
		player.experience_points += 5
		queue_free()
