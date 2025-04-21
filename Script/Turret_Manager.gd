extends Node3D
@export var road : Path3D
func summon_turret(location) :
	var turret = preload("res://Scenes/turret.tscn")
	var turret_instances = turret.instantiate()
	add_child(turret_instances)
	turret_instances.global_position = location
	turret_instances.road = road
