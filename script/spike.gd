extends Area2D

var i = 0

func _on_body_entered(body):
	if i == 0:
		if body.is_in_group("player"):
			body.stop_player_animation()
		i = 1	

