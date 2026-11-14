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
