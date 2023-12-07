extends ParallaxBackground

@export var speed = 100.0
@export var direction = Vector2.LEFT


func _process(delta):
	scroll_base_offset += (speed * direction) * delta
	#var botao = Input.get_axis("left", "right")
	#if botao and Input.is_action_pressed("run"):
#		scroll_base_offset += (speed * direction) * delta
#	elif botao:
		#scroll_base_offset += (speed * direction) * delta
