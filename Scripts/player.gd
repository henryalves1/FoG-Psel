extends CharacterBody2D

const bullet_scene = preload("res://Scenes/bullet.tscn")

@export var bullet_speed = 10.0
@export var speed = 100.0
@export var max_bullet_distance = 5
@export var bullets_per_wave = 4
var level = 0

signal expChange
signal levelUp

var experience_points = 0:
	set(new_experience):
		experience_points = new_experience
		if experience_points >= 10*pow(level,2):
			experience_points = 0
			level+=1
			levelUp.emit()
		expChange.emit()

func shoot():
	for i in range(bullets_per_wave):
		var bullet = bullet_scene.instantiate()
		add_child(bullet)
		
		bullet.get_node("Timer").wait_time = 0.9*$Timer.wait_time
		
		
		bullet.global_transform = global_transform
		bullet.velocity = bullet_speed*Vector2(cos(i * 2*PI/bullets_per_wave), sin(i * 2*PI/bullets_per_wave))

func _physics_process(delta: float) -> void:
	
	# pega a direção do movimento usando get_vector
	var direction := Input.get_vector("Left","Right","Up", "Down",)
	
	# se houver input e o jogador estiver parado, suaviza o ganho de velocidade
	if direction.length() != 0 and velocity.length() == 0:
		velocity = velocity.lerp(direction * speed, 0.1)
	else: velocity = direction * speed # caso nao tenha input, para imediatamente o personagem
	
	
	move_and_slide()

func _on_timer_timeout():
	shoot()


func _on_levelupscreen_stats_up(stat: String) -> void:
	match(stat):
		"bpw": bullets_per_wave *= 2
		"atk_vel": $Timer.wait_time *= 0.8
