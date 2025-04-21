extends Area3D

var direction : Vector3
@export var speed : float = 20

func _physics_process(delta):
	global_position += direction * speed * delta



func _on_area_entered(area):
	if area.name == "Enemy" :
		var enemy = area.get_parent()
		enemy.current_health -= 1
		queue_free()
