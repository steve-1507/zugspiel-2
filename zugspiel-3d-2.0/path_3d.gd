extends Node3D

@onready var path: Path3D = $"."

func _ready() -> void:
	if path == null:
		return

	var length := path.curve.get_baked_length()
	var d := 0.0

	while d <= length:
		var pos := path.curve.sample_baked(d)

		var mi := MeshInstance3D.new()
		mi.mesh = SphereMesh.new()
		mi.position = pos
		mi.scale = Vector3.ONE * 0.3
		add_child(mi)

		d += 1.0
