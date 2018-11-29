extends Node

export(PackedScene) var trunk_scene

onready var firstTrunkPos = $FirstTrunkPosition

var last_spawn_position

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

