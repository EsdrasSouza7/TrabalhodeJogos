extends Node

var ColetaLivro = 0

func _process(_delta):
	if ColetaLivro == 1:
		if Input.is_action_pressed("ui_accept"):
			var overlay_controller = get_node("macunaima/Livro2")
			var player = get_node("CharacterBody2D")
			overlay_controller.hide_overlay()
			player.Play_Player()
			ColetaLivro = 0
		pass
	elif ColetaLivro == 2:
		if Input.is_action_pressed("ui_accept"):
			var overlay_controller = get_node("o_cortico/Livro3")
			var player = get_node("CharacterBody2D")
			overlay_controller.hide_overlay()
			player.Play_Player()
			ColetaLivro = 0
		pass
func _on_macunaima_body_entered():
	if ColetaLivro == 0:
		var overlay_controller = get_node("macunaima/Livro2")
		var player = get_node("CharacterBody2D")
		var livro = get_node("macunaima")
		overlay_controller.show_overlay()
		player.Stop_Player()
		livro.hidden()
		ColetaLivro = 1
	pass


func _on_o_cortico_body_entered():
	if ColetaLivro == 0:
		var overlay_controller = get_node("o_cortico/Livro3")
		var player = get_node("CharacterBody2D")
		var livro = get_node("o_cortico")
		overlay_controller.show_overlay()
		player.Stop_Player()
		livro.hidden()
		ColetaLivro = 2
	pass # Replace with function body.
