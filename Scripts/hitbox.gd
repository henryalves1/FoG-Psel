extends Area2D

signal collided_with_bullet


func collided():
	collided_with_bullet.emit()
