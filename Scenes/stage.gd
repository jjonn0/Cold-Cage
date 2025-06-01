extends TileMapLayer

func get_tile_surface_type(location : Vector2) -> String:
	
	var tile_data : TileData = get_cell_tile_data(local_to_map(Vector2(location.x, location.y)))
	if tile_data == null:
		return "null"
	elif tile_data.has_custom_data("Surface"):
		var custom_data : String = tile_data.get_custom_data("Surface")
		return custom_data
	else:
		return "null"
