extends Camera3D
@export var HUD : MarginContainer
@onready var ray_cast_3d = $RayCast3D
@export var turret_manager : Node3D
@export var gridmap : GridMap
func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_pos) * 100
	ray_cast_3d.force_raycast_update()
	if ray_cast_3d.get_collider() is GridMap :
		var collision_point = ray_cast_3d.get_collision_point()
		var map_point_floor_0 = gridmap.local_to_map(collision_point) 
		var map_point_floor_1 = gridmap.local_to_map(collision_point) + Vector3i(0,1,0)
		if Input.is_action_just_pressed("Summon") and HUD.current_gold >= 5 :
			if gridmap.get_cell_item(map_point_floor_0) == 0 and gridmap.get_cell_item(map_point_floor_1) == -1: 
				gridmap.set_cell_item(map_point_floor_0, 13)
				var tile_pos = gridmap.map_to_local(map_point_floor_0)
				turret_manager.summon_turret(tile_pos)
				HUD.current_gold -= 5
				
