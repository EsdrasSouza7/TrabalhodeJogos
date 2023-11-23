extends CharacterBody2D


const SPEED = 140.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const anim = ["idle", "walk", "run", "jump", "hurt", "death"]

func clearSprites():
	for i in range(len(anim)):
		get_node("manage/"+anim[i]).visible = false

func _ready():
	clearSprites()
	get_node("manage/idle").visible = true
	get_node("manage/AnimationPlayer").play("idle")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
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

	if(not is_on_floor()):
		clearSprites()
		get_node("manage/jump").visible = true
		get_node("manage/AnimationPlayer").play("jump")
	
	if(Input.is_action_pressed("ui_left")):
		get_node("manage/idle").set_flip_h(true)
		get_node("manage/walk").set_flip_h(true)
		get_node("manage/jump").set_flip_h(true)
		get_node("manage/run").set_flip_h(true)
		get_node("manage/death").set_flip_h(true)
		get_node("manage/hurt").set_flip_h(true)
	elif(Input.is_action_pressed("ui_right")):
		get_node("manage/idle").set_flip_h(false)
		get_node("manage/walk").set_flip_h(false)
		get_node("manage/jump").set_flip_h(false)
		get_node("manage/run").set_flip_h(false)
		get_node("manage/death").set_flip_h(false)
		get_node("manage/hurt").set_flip_h(false)	
	
	move_and_slide()
