extends CharacterBody2D

@export_category("Player Movement")
@export var MAX_MOVE_SPEED : float = 400
@export var accelaration : float = 80
@export var deccelaration : float = 100
@export var jump_force : float = -600.0

@export_category("Coyote Time")
@export var coyote_time : float = 0.05
var coyote_timer : float 

@onready var bounce_cast : Node2D = get_node("RaycastContainer")
@export var game_manager : Node2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity  : float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	apply_gravity(delta)
	
	# Handle Jump.
	manage_coyote_time()
	handle_jump()

	check_bounce()

	movement()
	move_and_slide()
	

func apply_gravity(delta : float)->void:
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_jump()->void:
	if Input.is_action_just_pressed("ui_accept") && coyote_timer>0:
		velocity.y = jump_force

func manage_coyote_time()->void:
	if is_on_floor():
		coyote_timer = coyote_time

	if !is_on_floor() && coyote_timer >0:
		coyote_timer -= get_process_delta_time()


func movement()->void:
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x += accelaration * direction
	else:
		velocity.x = move_toward(velocity.x, 0, deccelaration)
		
	velocity.x = clampf(velocity.x,-MAX_MOVE_SPEED,MAX_MOVE_SPEED)

func check_bounce()->void:
	
	for ray in bounce_cast.get_children():
		if ray.is_colliding(): 
			var entity = ray.get_collider()
			if entity.has_method("be_bounced"):
				entity.call_deferred("be_bounced",self)
				break

func bounce(value)->void:
	velocity.y -= value

func SetRayCastCollisionsDefault()->void:
	for ray in bounce_cast.get_children():
		ray.set_collision_mask_value(3,true)
		ray.set_collision_mask_value(2,false)


func SetRayCastCollisionsGhost()->void:
	for ray in bounce_cast.get_children():
		ray.set_collision_mask_value(3,false)
		ray.set_collision_mask_value(2,true)

func RestartLevel()->void:
	game_manager.RestartGame()


