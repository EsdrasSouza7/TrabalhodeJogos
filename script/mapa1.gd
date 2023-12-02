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


func _on_dom_casmurro_body_entered(body):
	if ColetaLivro == 0:
		var overlay_controller = get_node("dom_casmurro/Livro1")
		var player = get_node("CharacterBody2D")
		var livro = get_node("dom_casmurro")
		overlay_controller.show_overlay()
		player.Stop_Player()
		livro.hidden()
		ColetaLivro = 1
	pass # Replace with function body.
