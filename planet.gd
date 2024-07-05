extends Node3D


@export var velocity : Vector3
@export var size : float
@export var surface_gravity : float
@export_color_no_alpha var color : Color = Color(1, 1, 1)



# Called when the node enters the scene tree for the first time.
func _ready():
	$Sphere.material.albedo_color = color
	scale = Vector3(size, size, size)
	add_to_group("bodies")

func _process(_delta):
	$Sphere.material.albedo_color = color
	scale = Vector3(size, size, size)
	
				

