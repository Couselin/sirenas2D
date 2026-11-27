extends Node2D

const idNorthEast:int = 0
const idEast:int = 1
const idSouthEast:int = 2
const idSouthWest:int = 3
const idWest:int = 4
const idNorthWest:int = 5

const idDirections = [idNorthEast, idEast, idSouthEast, idSouthWest, idWest, idNorthWest]

const dirNorthEast:Vector3 = Vector3(-1,1,0)
const dirEast:Vector3 = Vector3(0,1,-1)
const dirSouthEast:Vector3 = Vector3(1,0,-1)
const dirSouthWest:Vector3 = Vector3(1,-1,0)
const dirWest:Vector3 = Vector3(0,-1,1)
const dirNorthWest:Vector3 = Vector3(-1,0,1)

const dirDirections = [dirNorthEast, dirEast, dirSouthEast, dirSouthWest, dirWest, dirNorthWest]

const idDiagNorth:int = 0
const idDiagNorthEast:int = 1
const idDiagSouthEast:int = 2
const idDiagSouth:int = 3
const idDiagSouthWest:int = 4
const idDiagNorthWest:int = 5

const idDiagDirections = [idDiagNorth, idDiagNorthEast, idDiagSouthEast, idDiagSouth, idDiagSouthWest, idDiagNorthWest]

const dirDiagNorth:Vector3 = Vector3(-2,1,1)
const dirDiagNorthEast:Vector3 = Vector3(-1,2,-1)
const dirDiagSouthEast:Vector3 = Vector3(1,1,-2)
const dirDiagSouth:Vector3 = Vector3(2,-1,-1)
const dirDiagSouthWest:Vector3 = Vector3(1,-2,1)
const dirDiagNorthWest:Vector3 = Vector3(-1,-1,2)

const dirDiagDirections = [dirDiagNorth, dirDiagNorthEast, dirDiagSouthEast, dirDiagSouth, dirDiagSouthWest, dirDiagNorthWest]

func check_vector(vector:Vector3):
	if(vector.x + vector.y + vector.z == 0):
		return true
	else:
		return false

func round_vector(vector:Vector3):
	var rounded_vector = round(vector)
	var dif = abs(vector - rounded_vector)
	if dif.x > dif.y and dif.x > dif.z:
		rounded_vector.x = - rounded_vector.y - rounded_vector.z
	elif dif.y > dif.z:
		rounded_vector.y = - rounded_vector.x - rounded_vector.z
	else:
		rounded_vector.z = - rounded_vector.x - rounded_vector.y
	return rounded_vector

func contiguous_tiles(tile:Vector3):
	var tiles: Array[Vector3]
	tiles.resize(idDirections.size())
	for i in range(tiles.size()):
		tiles[i] = tile + dirDirections[i]
	return tiles

func alternating_tiles(tile:Vector3, direction:int):
	var tiles = contiguous_tiles(tile)
	return [tiles[direction], tiles[direction-2], tiles[direction-4]]

func diagonal_tiles(tile:Vector3):
	var tiles: Array[Vector3]
	tiles.resize(idDiagDirections.size())
	for i in range(tiles.size()):
		tiles[i] = tile + dirDiagDirections[i]
	return tiles

func directional_ray(tile:Vector3, direction:Vector3, range:int, collision:bool, board:Board):
	var tiles: Array[Vector3]
	if range > 0:
		for i in range(1, range+1):
			var newTile: Vector3 = tile + direction * i
			if board.get_tile(newTile.x, newTile.y, newTile.z):
				tiles.append(newTile)
				if board.get_tile(newTile.x, newTile.y, newTile.z).isOccupied and collision:
					break
	else:
		for i in range(1, board.boardRadius*2+1):
			var newTile: Vector3 = tile + direction * i
			if board.get_tile(newTile.x, newTile.y, newTile.z):
				tiles.append(newTile)
				if board.get_tile(newTile.x, newTile.y, newTile.z).isOccupied and collision:
					break
	return tiles

func distance_between_tiles(tile1:Vector3, tile2:Vector3):
	var difference = abs(Vector3(tile2.x-tile1.x, tile2.y-tile1.y, tile2.z-tile1.z))
	var distance = max(difference.x, difference.y, difference.z)
	return distance

func ray_between_tiles(tile1:Vector3, tile2:Vector3):
	var distance = distance_between_tiles(tile1, tile2)
	var tiles: Array[Vector3]
	tiles.resize(distance-1)
	for i in range(1, distance):
		tiles[i-1] = tile1 + round_vector((tile2 - tile1) * 1/distance * i)
	return tiles

func tiles_in_range(tile:Vector3, range:int):
	var tiles:Array[Vector3]
	for i in range(-range, range+1):
		for j in range (max(-range, -i-range),min(range+1, -i+range+1)):
			tiles.append(Vector3(i,j,-i-j)+tile)
	return tiles
