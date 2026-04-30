extends Node3D

@onready var path: Path3D = $"."

func _ready() -> void:
	if path == null:
		return

	var length := path.curve.get_baked_length()
	var d := 0.0

	while d <= length:
		var pos := path.curve.sample_baked(d)
		if not first:
			var mid := (prev_pos + pos) / 2.0
			var diff := pos - prev_pos
			var dist := diff.length()
			var rail := MeshInstance3D.new()
			rail.mesh = schiene
			rail.position = mid
			rail.scale = Vector3(dist, 1.0, 1.0)
			rail.rotation_degrees = Vector3i(pos)
			rail.basis = Basis.looking_at(diff.normalized(), Vector3.UP)
			add_child(rail)
		prev_pos = pos
		first = false
		d += step
