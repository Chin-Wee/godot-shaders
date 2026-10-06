extends Node3D

@onready var _blended_cube: MeshInstance3D = $BlendedCube
@onready var _clipped_cube: MeshInstance3D = $ClippedCube
@onready var _main_cube: MeshInstance3D = $MainCube
@onready var _camera: Camera3D = $Camera3D

@onready var clipped_start_color: Color = _clipped_cube.get_surface_override_material(0).albedo_color
@onready var blended_start_color: Color = _blended_cube.get_surface_override_material(0).albedo_color
@onready var main_start_color: Color = _main_cube.get_surface_override_material(0).albedo_color


func setup() -> void:
	_blended_cube.get_surface_override_material(0).albedo_color = Color.TRANSPARENT
	_clipped_cube.get_surface_override_material(0).albedo_color = Color.TRANSPARENT
	_main_cube.get_surface_override_material(0).albedo_color = Color.TRANSPARENT


func show_clipped_cube() -> void:
	var tween := create_tween()
	tween.tween_property(_clipped_cube.get_surface_override_material(0), "albedo_color", clipped_start_color, 1.0)


func show_blended_cube() -> void:
	var tween := create_tween()
	tween.tween_property(_blended_cube.get_surface_override_material(0), "albedo_color", blended_start_color, 1.0)


func show_main_cube() -> void:
	var tween := create_tween()
	tween.tween_property(_main_cube.get_surface_override_material(0), "albedo_color", main_start_color, 1.0)
	await tween.finished
	(_main_cube.get_surface_override_material(0) as BaseMaterial3D).transparency = BaseMaterial3D.TRANSPARENCY_DISABLED
