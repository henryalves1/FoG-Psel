extends CharacterBody2D

const bullet_scene = preload("res://Scenes/bullet.tscn")

@export var bullet_speed = 10.0
@export var speed = 100.0
@export var max_bullet_distance = 5
@export var bullets_per_wave = 4

func shoot():
	for i in range(bullets_per_wave):
		var bullet = bullet_scene.instantiate()
		add_child(bullet)
		
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
