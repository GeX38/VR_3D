extends XROrigin3D

@export var player: Bobik

func _ready() -> void:
	$XRCamera3D.player = player
	$LeftHand.player = player
	$RightHand.player = player

func _physics_process(delta: float) -> void:
	global_position = player.head.global_position
