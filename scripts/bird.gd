# script: bird

extends RigidBody2D

func _ready():
	set_linear_velocity(Vector2(50, get_linear_velocity().y))
	set_fixed_process(true)
	set_process_input(true)
	pass
	
func _fixed_process(delta):
	if rad2deg(get_rot()) > 30:
		set_rot(deg2rad(30))
		set_angular_velocity(0)
		
	if get_linear_velocity().y > 0:
		set_angular_velocity(1.5)
	
func flap():
	set_linear_velocity(Vector2(get_linear_velocity().x, -150))
	set_angular_velocity(-3)
	
func _input(event):
	if event.type != InputEvent.KEY: return
	if event.is_action_pressed("flap"):
		flap()
