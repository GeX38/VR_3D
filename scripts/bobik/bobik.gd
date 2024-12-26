class_name Bobik extends CharacterBody3D

@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5

@onready var mesh: MeshInstance3D = $MeshInstance3D
@onready var collision: CollisionShape3D = $CollisionShape3D
@onready var head: Node3D = $Head

var body_correction: Vector3 = Vector3.ZERO
var rotation_correction: Vector3 = Vector3.ZERO

var x_input: float = 0
var z_input: float = 0

var jump_input: float = 0

func jump():
	jump_input = 1

func _physics_process(delta: float) -> void:
	mesh.position = body_correction
	collision.position = body_correction
	mesh.rotation = rotation_correction
	collision.rotation = rotation_correction
	head.rotation = rotation_correction
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if jump_input > 0 and is_on_floor():
		velocity.y = JUMP_VELOCITY * clampf(0, 1, jump_input)
		jump_input = 0

	var direction = (transform.basis * Vector3(x_input, 0, z_input)).normalized() * clampf(max(abs(x_input), abs(z_input)), 0, 1)
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
