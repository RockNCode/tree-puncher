extends Node

export(PackedScene) var trunk_scene

onready var firstTrunkPos = $FirstTrunkPosition

var last_spawn_position
var last_has_axe = false
var last_axe_right = false

var trunks = []

func _ready():
	last_spawn_position = firstTrunkPos.position
	_spawn_first_trunks()
	pass

func _spawn_first_trunks():
	for counter in range(5):
		var newTrunk = trunk_scene.instance()
		add_child(newTrunk)
		newTrunk.position = last_spawn_position
		last_spawn_position.y -= newTrunk.sprite_height
		newTrunk.initialize_trunk(false,false)
		trunks.append(newTrunk)
		
func _add_trunk(axe, axe_right):
	var newTrunk = trunk_scene.instance()
	add_child(newTrunk)
	newTrunk.position = last_spawn_position
	newTrunk.initialize_trunk(axe,axe_right)
	trunks.append(newTrunk)

func punch_tree(from_right):
	if !last_has_axe:
		if rand_range(0,100) > 50:
			last_axe_right = rand_range(0,100) > 50
			last_has_axe = true
			#spawn trunk
		else:
			last_has_axe = false
			#spawn trunk
	else:
		if rand_range(0,100) > 50 :
			last_has_axe = true
			#spawn trunk same position as last
		else:
			last_has_axe = false
			#spawn trunk without axe
	_add_trunk(last_has_axe,last_axe_right)

	trunks[0].remove(from_right)
	trunks.pop_front()
	for trunk in trunks:
		trunk.position.y += trunk.sprite_height
