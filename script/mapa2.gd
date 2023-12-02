extends Node

var ColetaLivro = 0
var overlay_scene_instance1 = null
var overlay_scene_instance2 = null


func _ready():
	overlay_scene_instance1 = preload("res://scenes/livro_2.tscn").instantiate()
	add_child(overlay_scene_instance1)
	overlay_scene_instance1.visible = false
	overlay_scene_instance2 = preload("res://scenes/livro_3.tscn").instantiate()
	add_child(overlay_scene_instance2)
	overlay_scene_instance2.visible = false

func _process(_delta):
	if ColetaLivro == 1:
		if Input.is_action_pressed("ui_accept"):
			var player = get_node("CharacterBody2D")
			hide_overlay1()
			player.Play_Player()
			ColetaLivro = 0
		pass
	elif ColetaLivro == 2:
		if Input.is_action_pressed("ui_accept"):
			var player = get_node("CharacterBody2D")
			hide_overlay2()
			player.Play_Player()
			ColetaLivro = 0
		pass

func show_overlay1():
	# Torna a cena de sobreposição visível
	overlay_scene_instance1.visible = true
	overlay_scene_instance1.set_process_input(true)

func hide_overlay1():
	# Torna a cena de sobreposição invisível
	overlay_scene_instance1.visible = false
	overlay_scene_instance1.set_process_input(false)

func show_overlay2():
	# Torna a cena de sobreposição visível
	overlay_scene_instance2.visible = true
	overlay_scene_instance2.set_process_input(true)

func hide_overlay2():
	# Torna a cena de sobreposição invisível
	overlay_scene_instance2.visible = false
	overlay_scene_instance2.set_process_input(false)

func _on_macunaima_body_entered(_body):
	if ColetaLivro == 0:
		var player = get_node("CharacterBody2D")
		var livro = get_node("macunaima")
		overlay_scene_instance1.position = Vector2i(1640, -220)
		show_overlay1()
		player.Stop_Player()
		livro.queue_free()
		ColetaLivro = 1
	pass

func _on_o_cortico_body_entered(_body):
	if ColetaLivro == 0:
		var player = get_node("CharacterBody2D")
		var livro = get_node("o_cortico")
		overlay_scene_instance2.position = Vector2i(2927, -225)
		show_overlay2()
		player.Stop_Player()
		livro.queue_free()
		ColetaLivro = 2
	pass 
	
