extends Node3D

@export var path: Path3D

func _ready() -> void:
	"""var all_nodes = get_tree().root.find_children("*", "MeshInstance3D", true, false)
	for node in all_nodes:
		var mesh = node as MeshInstance3D
		for i in mesh.get_surface_override_material_count():
			var mat = mesh.get_active_material(i)
			if mat is StandardMaterial3D:
				mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED"""
	if path == null:
		return

	var arr := []
	arr.resize(Mesh.ARRAY_MAX)
	arr[Mesh.ARRAY_VERTEX] = path.curve.get_baked_points()

	var mi := MeshInstance3D.new()
	add_child(mi)
