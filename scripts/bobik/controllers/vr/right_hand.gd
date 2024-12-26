extends XRController3D

var player: Bobik

var magic_sphere_scene: PackedScene = preload("res://scenes/objects/magic_sphere.tscn")

@export var sphere: Node3D
@export var cooldown: float = 1

var timer = 0

func _ready() -> void:
	input_float_changed.connect(_input_float_changed)
	button_pressed.connect(_button_pressed)
	
func _physics_process(delta: float) -> void:
	if sphere == null and timer > 0:
		timer -= delta
		if timer <= 0:
			sphere = magic_sphere_scene.instantiate()
			add_child(sphere)
			sphere.position = $shoot_pivot.position
	
func _button_pressed(name: String):
	if name == 'ax_button':
		player.jump()
	
func _input_float_changed(name: String, value: float):
	if name == 'trigger' and value > 0.5 and sphere != null:
		sphere.reparent(get_tree().root)
		sphere.throw()
		sphere = null
		timer = cooldown
