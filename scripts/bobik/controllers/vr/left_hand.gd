extends XRController3D

var player: Bobik
	
func _physics_process(delta: float) -> void:
	var value = get_vector2('primary')
	var direction = value.rotated(rotation.y)
	player.x_input = direction.x
	player.z_input = -direction.y
