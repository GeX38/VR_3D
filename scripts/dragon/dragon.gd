extends CharacterBody3D


const SPEED = 2.5
const ROTATION_SPEED = 5
const JUMP_VELOCITY = 4.5

@export var target_bobik: Bobik

var health = 100

func take_damage(damage: int):
	if health <= 0:
		return
	health -= damage
	if health <= 0:
		$AAAAAAAAAA.play()
		visible = false
		await get_tree().create_timer(5).timeout
		health = 500
		var forward = -target_bobik.head.global_transform.basis.z
		global_position = target_bobik.head.global_transform.origin + forward * 20
		$AAAAAAAAAA2.play()
		visible = true

func _physics_process(delta: float) -> void:
	$MegaDragon/AnimationPlayer.play('Object_0')
	var direction = global_position.direction_to(target_bobik.global_position).normalized()
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		
		global_rotation.y = lerp_angle(global_rotation.y, atan2(direction.x, direction.z), delta * ROTATION_SPEED)
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
