extends RigidBody3D

var boob_babah_scene: PackedScene = preload("res://scenes/boom_babah.tscn")
	
func throw():
	freeze = false
	linear_velocity = transform.basis * Vector3.FORWARD * 20

func get_damage() -> int:
	return 15


func _on_body_entered(body: Node) -> void:
	if body.has_method("take_damage"):
		body.take_damage(get_damage())
		
	var boom_babah: GPUParticles3D = boob_babah_scene.instantiate()
	get_tree().root.add_child(boom_babah)
	boom_babah.global_position = global_position
	boom_babah.emitting = true

	queue_free()
