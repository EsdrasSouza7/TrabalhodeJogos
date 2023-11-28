extends Camera2D

# Adicione a variável necessária
var original_zoom: Vector2

func _ready():
	# Salve a escala original da câmera
	original_zoom = scale

func reset_zoom():
	# Reset a escala da câmera para a original
	scale = original_zoom
