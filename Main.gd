extends Node

export (PackedScene) var mob_scene = preload("res://Mob.tscn")

func _ready():
	randomize()

func _on_MobTimer_timeout():
	var mob: Mob = mob_scene.instance()
	
	var mob_spawn_location = $SpawnPath/SpawnLocation
	mob_spawn_location.unit_offset = randf()
	
	var player_position = $Player.transform.origin
	
	add_child(mob) # This adds the mob to the scene
	mob.initialize(mob_spawn_location.translation, player_position)
