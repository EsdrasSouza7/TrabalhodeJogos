extends CharacterBody2D


const SPEED: float = 140.0
const SPEED_RUN: float = 210.0 
const JUMP_VELOCITY: float = -300.0
var death_zoom_speed = 0.01
var max_zoom = 5.0
var pause = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
const anim: Array = ["idle", "walk", "run", "jump", "hurt", "death"]

var interface_scene: CanvasLayer
var canvas_layer : CanvasLayer
var is_alive : bool = true

func clearSprites():
	for i in range(len(anim)):
		get_node("manage/"+anim[i]).visible = false
		get_node("Camera2D/GamerOver").visible = false
		
func _ready():
	
	clearSprites()
	get_node("manage/idle").visible = true
	get_node("manage/AnimationPlayer").play("idle")
	#interface_scene = preload("res://scenes/Pause.tscn").instantiate()
	#$CanvasLayer.add_child(interface_scene)
	#interface_scene.rect_position = Vector2(-1000, -1000)
	# Instanciar a cena da interface
	canvas_layer = preload("res://scenes/Pause.tscn").instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
	# Adicionar o CanvasLayer à cena principal
	$CanvasLayer.add_child(canvas_layer)
	# Definir a posição inicial (pode ser ajustada conforme necessário)
	canvas_layer.rect_position = Vector2(-1000, -1000)

func _process(delta: float) -> void:
	if is_alive:
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta

		# Handle Jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("left", "right")
		if direction and Input.is_action_pressed("run"):
			velocity.x = direction * SPEED_RUN
			if(is_on_floor()):
				clearSprites()
				get_node("manage/run").visible = true
				get_node("manage/AnimationPlayer").play("run")
		elif direction:
			velocity.x = direction * SPEED
			if(is_on_floor()):
				clearSprites()
				get_node("manage/walk").visible = true
				get_node("manage/AnimationPlayer").play("walk")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if(is_on_floor()):
				clearSprites()
				get_node("manage/idle").visible = true
				get_node("manage/AnimationPlayer").play("idle")
				
		if(Input.is_action_just_pressed("pause")) and pause == 0:
			interface_scene.rect_position = Vector2(0, 0)
			pause = 1
			
		elif(Input.is_action_just_pressed("pause")) and pause == 1:
			interface_scene.rect_position = Vector2(1000, 1000)
			pause = 0

		if(Input.is_action_just_pressed("jump") and is_on_floor()):
			clearSprites()
			get_node("manage/jump").visible = true
			get_node("manage/AnimationPlayer").play("jump")
		
		if(Input.is_action_pressed("left")):
			get_node("manage/idle").set_flip_h(true)
			get_node("manage/walk").set_flip_h(true)
			get_node("manage/jump").set_flip_h(true)
			get_node("manage/run").set_flip_h(true)
			get_node("manage/death").set_flip_h(true)
			get_node("manage/hurt").set_flip_h(true)
		elif(Input.is_action_pressed("right")):
			get_node("manage/idle").set_flip_h(false)
			get_node("manage/walk").set_flip_h(false)
			get_node("manage/jump").set_flip_h(false)
			get_node("manage/run").set_flip_h(false)
			get_node("manage/death").set_flip_h(false)
			get_node("manage/hurt").set_flip_h(false)
			
		move_and_slide()
	else: 
		
		# Reduza a escala da câmera para criar um efeito de zoom
		#%Camera2D.zoom += Vector2(death_zoom_speed, death_zoom_speed)
		# Limite o zoom máximo
		#%Camera2D.zoom.x = min(max_zoom, %Camera2D.zoom.x)
		#%Camera2D.zoom.y = min(max_zoom, %Camera2D.zoom.y)
		pass


func death_player_animation() -> void:
	is_alive = false
	clearSprites()
	get_node("manage/death").visible = true
	get_node("manage/AnimationPlayer").play("death")
	get_node("Camera2D/GamerOver").visible = true
	




