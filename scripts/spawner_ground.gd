# script: spawner_ground
extends Node2D

const scn_ground = preload("res://scenes/ground.tscn")
const GROUND_WIDTH = 168
const AMOUNT_TO_FILL_VIEW = 2

func _ready():
	for i in range(AMOUNT_TO_FILL_VIEW):
		spawner_ground()
		goto_next_pos()
	pass

func spawner_ground():
	var new_ground = scn_ground.instance()
	new_ground.set_pos(get_pos())
	new_ground.connect("destroyed", self, "spawner_ground")
	new_ground.connect("destroyed", self, "goto_next_pos")
	get_node("container").add_child(new_ground)
	pass
	
func goto_next_pos():
	set_pos(get_pos() + Vector2(GROUND_WIDTH, 0))
	pass