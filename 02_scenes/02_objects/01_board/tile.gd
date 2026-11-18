extends Node2D
class_name Tile

@export var coordinates:Vector3
var isOccupied:bool = false

func add_piece(piece):
	var pieceRef = load("res://02_scenes/01_characters_props/piece_"+piece+".tscn")
	var newPiece = pieceRef.instantiate() as Piece
	add_child(newPiece)

func get_piece():
	if isOccupied:
		for i in get_children():
			if GlobalFunctions.get_class_name(i) == "Piece":
				return i
	return false

func get_board():
	var board:Board = get_parent()
	return board

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
