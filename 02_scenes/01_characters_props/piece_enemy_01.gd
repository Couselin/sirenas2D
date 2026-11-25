extends "res://02_scenes/01_characters_props/piece.gd"

func move():
	for i in range(movementRange):
		if GlobalBoard.distance_between_tiles(tile.coordinates, Vector3(0,0,0)) > 1:
			var tiles = GlobalBoard.ray_between_tiles(tile.coordinates, Vector3(0,0,0))
			var tileDirection:Tile = tile.get_board().get_tile(tiles[0].x,tiles[0].y,tiles[0].z)
			set_direction(tileDirection.coordinates - tile.coordinates)
			var altDirections
			if tileDirection.isOccupied:
				for j in range(0,GlobalBoard.dirDirections.size()):
					if GlobalBoard.dirDirections[j] == direction:
						altDirections = [j-1, j-5]
						break
				var altTile = tile.coordinates + GlobalBoard.dirDirections[altDirections[0]]
				if tile.get_board().get_tile(altTile.x,altTile.y,altTile.z).isOccupied:
					altTile = tile.coordinates + GlobalBoard.dirDirections[altDirections[1]]
					if tile.get_board().get_tile(altTile.x,altTile.y,altTile.z).isOccupied:
						i = movementRange
					else:
						change_tile(tile.get_board().get_tile(altTile.x,altTile.y,altTile.z))
						set_direction(GlobalBoard.dirDirections[altDirections[1]])
				else: 
					change_tile(tile.get_board().get_tile(altTile.x,altTile.y,altTile.z))
					set_direction(GlobalBoard.dirDirections[altDirections[0]])
			else:
				change_tile(tileDirection)
			await get_tree().create_timer(Global.movementCadence).timeout

func attack():
	var targetCoordinates: Array[Vector3]
	var targets: Array[Tile]
	var directions = [direction,
	GlobalBoard.dirDirections[GlobalBoard.dirDirections.find(direction)-3]]
	for i in directions:
		targetCoordinates += GlobalBoard.directional_ray(tile.coordinates,i,0,false,tile.get_board())
	for i in targetCoordinates:
		targets.append(tile.get_board().get_tile(i.x,i.y,i.z))
	for i in targets:
		i.highlight(true) #temp
		if i.isOccupied and i.get_piece().isAlly != isAlly:
			cause_damage(i.get_piece())

func cause_damage(target:Piece):
	super.cause_damage(target)

func take_damage(damageTaken:int):
	super.take_damage(damageTaken)
	if life <=0:
		tile.isOccupied = false
		queue_free()

func change_tile(new_tile:Tile):
	super.change_tile(new_tile)

func set_direction(new_direction:Vector3):
	super.set_direction(new_direction)

func _ready() -> void:
	super._ready()

func _process(delta: float) -> void:
	super._process(delta)
