extends Node3D
var road : Path3D
var target : PathFollow3D
@onready var cannon = $Cannon
@onready var bullet_manager = $Bullet_Manager
@onready var timer = $Timer

func _ready():
	await get_tree().create_timer(4).timeout
	shoot()
	timer.start()

func _physics_process(delta):
	find_enemies()

func find_enemies() :
	target = null
	var progress = 0
	for enemies in road.get_children() :
		if enemies is PathFollow3D :
			if enemies.progress > progress :
				if cannon.global_position.distance_to(enemies.global_position) <= 10 :
					progress = enemies.progress
					target = enemies

	if target :
		var direction = (target.global_position - cannon.global_position).normalized()
		direction.y = 0 
		cannon.look_at(cannon.global_position + direction, Vector3.UP, false)

func shoot() :
	if target :
		var bullet = preload("res://Scenes/bullet.tscn")
		var bullet_instances = bullet.instantiate()
		bullet_manager.add_child(bullet_instances)
		bullet_instances.direction = (target.global_position - cannon.global_position).normalized()
		bullet_instances.global_position = cannon.global_position + Vector3(0,0.23,0)

