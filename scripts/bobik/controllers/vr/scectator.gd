extends Camera3D

@export var target: Camera3D

func _physics_process(delta: float) -> void:
	global_position = target.global_position
	global_rotation = target.global_rotation
