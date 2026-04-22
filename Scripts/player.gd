extends CharacterBody2D


@export var speed = 100.0
@onready var _animated_sprite = $AnimatedSprite2D
var isAttacking = false

func _physics_process(delta: float) -> void:
	
	# pega a direção do movimento usando get_vector
	var direction := Input.get_vector("Left","Right","Up", "Down",)
	
	# se houver input, suaviza o ganho de velocidade
	if direction.length() != 0:
		velocity = velocity.lerp(direction * speed, 0.1)
	else: velocity = direction * speed # caso nao tenha input, para imediatamente o personagem
	
	# logica para inverter o sprite
	if velocity.x < 0: _animated_sprite.flip_h = true	
	elif velocity.x > 0: _animated_sprite.flip_h = false

	if !isAttacking:
	# se houver velocidade, muda a animação para correr
		if velocity.length() != 0:
			_animated_sprite.play("run")
		else: _animated_sprite.play("idle")
	
	if Input.get_action_strength("Attack"):
		isAttacking = true
		_animated_sprite.play("attack1")
		await _animated_sprite.animation_finished
		isAttacking = false
		
	
	#_on_animated_sprite_2d_animation_finished()

	move_and_slide()

	


func _on_animated_sprite_2d_animation_finished() -> void:
	if _animated_sprite.animation == "Attack":
		isAttacking = false
