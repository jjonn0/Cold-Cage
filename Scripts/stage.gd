extends TileMapLayer

@export_category("Tiles Physics")
@export var normal_friction : float = 20.0
@export var ice_friction : float = 2.0

var last_friction_value : float = 0.0

func get_custom_tile_data(location : Vector2, custom_type : String) -> String:
	
	var tile_data : TileData = get_cell_tile_data(local_to_map(Vector2(location.x, location.y)))
	if tile_data == null:
		return "null"
	elif tile_data.has_custom_data(custom_type):
		var custom_data : String = tile_data.get_custom_data(custom_type)
		return custom_data
	else:
		return "null"

func get_friction(location : Vector2) -> float:
	
	var surface_data : String = get_custom_tile_data(location, "Surface")
	
	if surface_data == "ice":
		last_friction_value = ice_friction
	elif surface_data == "":
		last_friction_value = normal_friction
	else:
		last_friction_value = last_friction_value
	
	return last_friction_value
