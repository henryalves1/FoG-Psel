extends CharacterBody2D

func _physics_process(delta: float) -> void:
	move_and_slide()




func _on_timer_timeout() -> void:
	queue_free()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		area.collided()
		queue_free()
