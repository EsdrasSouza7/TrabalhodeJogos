extends Node

var ColetaLivro = 0
var overlay_scene_instance = null

func _ready():
	# Carrega a cena de sobreposição
	overlay_scene_instance = preload("res://scenes/livro_1.tscn").instantiate()
	# Adiciona a cena de sobreposição como filho do controlador, mas a mantém invisível
	add_child(overlay_scene_instance)
	overlay_scene_instance.visible = false
	
func _process(_delta):
	if ColetaLivro == 1:
		if Input.is_action_pressed("ui_accept"):
			var player = get_node("player")
			hide_overlay()
			player.Play_Player()
			ColetaLivro = 0
		pass

func show_overlay():
	# Torna a cena de sobreposição visível
	overlay_scene_instance.visible = true
	overlay_scene_instance.set_process_input(true)

func hide_overlay():
	# Torna a cena de sobreposição invisível
	overlay_scene_instance.visible = false
	overlay_scene_instance.set_process_input(false)

func _on_dom_casmurro_body_entered(_body):
	if ColetaLivro == 0:
		var player = get_node("player")
		var livro = get_node("dom_casmurro")
		overlay_scene_instance.position = Vector2i(575, -45)
		show_overlay()
		player.Stop_Player()
		livro.queue_free()
		ColetaLivro = 1
	pass # Replace with function body.
