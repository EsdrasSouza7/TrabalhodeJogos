extends Control

var overlay_scene_instance = null

func _ready():
	# Carrega a cena de sobreposição
	overlay_scene_instance = preload("res://scenes/livro_2.tscn").instantiate()
	# Adiciona a cena de sobreposição como filho do controlador, mas a mantém invisível
	add_child(overlay_scene_instance)
	overlay_scene_instance.visible = false

func show_overlay():
	# Torna a cena de sobreposição visível
	overlay_scene_instance.visible = true
	overlay_scene_instance.set_process_input(true)

func hide_overlay():
	# Torna a cena de sobreposição invisível
	overlay_scene_instance.visible = false
	overlay_scene_instance.set_process_input(false)
