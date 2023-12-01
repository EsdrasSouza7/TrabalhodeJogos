extends Node


func _on_macunaima_body_entered(body):
	var overlay_controller = get_node("macunaima/Control")
	var player = get_node("CharacterBody2D")
	overlay_controller.show_overlay()
	player.Stop_Player()
		if Input.is_action_pressed("ui_accept"):
			overlay_controller.hide_overlay()
			player.Play_Player()
			break
	pass # Replace with function body.
