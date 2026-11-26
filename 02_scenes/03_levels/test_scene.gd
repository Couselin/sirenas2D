extends Node2D

#the following code is purely for testing purposes

@onready var board = $Board

var controlledPiece:Piece

func move(dir:Vector3):
	for i:Tile in board.tiles:
		if i.isOccupied:
			var piece = i.get_piece()
			if piece == controlledPiece:
				var newCoords = i.coordinates + dir
				if board.get_tile(int(newCoords.x),int(newCoords.y),int(newCoords.z)):
					var newTile:Tile = board.get_tile(int(newCoords.x),int(newCoords.y),int(newCoords.z))
					piece.change_tile(newTile)
					break

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("test_q"):
		controlledPiece.attack()
	if event.is_action_pressed("test_e"):
		controlledPiece.move()
	'if event.is_action_pressed("test_e"):
		move(GlobalBoard.dirNorthEast)
	if event.is_action_pressed("test_z"):
		move(GlobalBoard.dirSouthWest)
	if event.is_action_pressed("test_d"):
		move(GlobalBoard.dirEast)
	if event.is_action_pressed("test_a"):
		move(GlobalBoard.dirWest)
	if event.is_action_pressed("test_c"):
		move(GlobalBoard.dirSouthEast)
	if event.is_action_pressed("test_q"):
		move(GlobalBoard.dirNorthWest)'

func _ready() -> void:
	board.get_tile(0,0,0).add_piece("tower")
	board.get_tile(0,1,-1).add_piece("ally01")
	board.get_tile(0,3,-3).add_piece("enemy03")
	controlledPiece = board.get_tile(0,3,-3).get_piece()
	controlledPiece.set_direction(GlobalBoard.dirNorthEast)
	pass

func _process(delta: float) -> void:
	pass
