extends "res://02_scenes/01_characters_props/piece.gd"

func move():
	for i in range(movementRange):
		var targets: Array[Tile]
		var tiles = GlobalBoard.ray_between_tiles(tile.coordinates, Vector3(0,0,0))
		var tileDirection:Tile = tile.get_board().get_tile(tiles[0].x,tiles[0].y,tiles[0].z)
		direction = tileDirection.coordinates - tile.coordinates
		if tileDirection.isOccupied:
			
			pass
		else:
			change_tile(tileDirection)
			set_direction(direction)
			pass
		await get_tree().create_timer(1).timeout

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
