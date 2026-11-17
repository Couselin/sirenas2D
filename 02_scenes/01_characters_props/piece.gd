extends Node2D
class_name Piece

var isAlly:bool = true
var tile:Tile
var tileOffset:Vector2 = (Vector2(0,0))

func change_tile(new_tile):
	tile.isOccupied = false
	tile = new_tile
	tile.isOccupied = true
	reparent(tile)
	position = tileOffset

func _ready() -> void:
	tile = get_parent()
	tile.isOccupied = true
	position = tileOffset

func _process(delta: float) -> void:
	pass
