extends Node3D


@export var camera_body : Node
@export var follow_body : bool
@export var path_steps : int
var bodies : Array
var paused : bool = true
var distance_to_body : float
var direction_to_body : Vector3

func _process(delta):
	
	if Input.is_action_just_pressed("pause"):
		paused = !paused
		

func _physics_process(delta):
	bodies = get_tree().get_nodes_in_group("bodies")
	for i in range(bodies.size()):
		var this_body = bodies[i]
		if !paused:
			for j in range(bodies.size()):
					if i != j:
						distance_to_body = 	this_body.position.distance_to(bodies[j].position)
						direction_to_body = this_body.position.direction_to(bodies[j].position)
						
						this_body.velocity += direction_to_body * bodies[j].surface_gravity * pow(bodies[j].size/2, 2) / pow(distance_to_body, 2)
						this_body.position += this_body.velocity / 120
	if follow_body:
		get_node("Camera").position.x = camera_body.position.x
		get_node("Camera").position.y = camera_body.position.y
				
					
			
