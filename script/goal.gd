extends Area2D


func _on_body_entered(body):

	if(body.name == "player"):
		var scena = get_tree().current_scene.name
		if(scena == "mapa1"):
			get_tree().change_scene_to_file("res://scenes/mapa2.tscn")
		elif(scena == "mapa2"):
			get_tree().change_scene_to_file("res://scenes/Creditos.tscn")
