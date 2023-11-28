extends Area2D

@onready var transition = $"../transition"
@export var next_level: String = ""

func _on_body_entered(body):
	if(body.name == "player"):
		get_tree().change_scene_to_file("res://scenes/mapa2.tscn")
	
