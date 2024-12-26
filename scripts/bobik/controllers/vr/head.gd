extends XRCamera3D

var player: Bobik

func _physics_process(delta: float) -> void:
	player.body_correction = position
	player.rotation_correction.y = rotation.y
