# script: camera

extends Camera2D

onready var bird = utils.get_main_node().get_node("bird")
func _ready():
	pass
	set_fixed_process(true)

func _fixed_process(delta):
	set_pos(Vector2(bird.get_pos().x,get_pos().y))
	pass
	
func get_total_pos():
	return get_pos() + get_offset()