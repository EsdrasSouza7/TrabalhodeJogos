extends Node2D

var speed = Vector2(200, 0)  # Ajuste a velocidade conforme necessário

func _process(delta):
	position.x += speed.x * delta
