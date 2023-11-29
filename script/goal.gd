extends Area2D


func _on_body_entered(body):

	if(body.name == "player"):
		var scena = get_tree().current_scene.name
		if(scena == "node_2d"):
			get_tree().change_scene_to_file("res://scenes/mapa1.tscn")
		elif(scena == "mapa1"):
			get_tree().change_scene_to_file("res://scenes/mapa2.tscn")
	
