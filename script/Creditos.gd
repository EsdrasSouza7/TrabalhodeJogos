extends Control

func _process(_delta):
	if(Input.is_action_just_pressed("pause")):
		get_tree().change_scene_to_file("res://scenes/start.tscn")
