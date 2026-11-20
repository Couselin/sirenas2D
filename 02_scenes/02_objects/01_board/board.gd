extends Node2D
class_name Board

@export var boardRadius: int = 0
@onready var tileRef = preload("res://02_scenes/02_objects/01_board/tile.tscn")
const tileSize = Vector2(27.5,40)

var tiles: Array[Tile] = []

func create_board():
	for i in range(-boardRadius,boardRadius+1):
		for j in range(-boardRadius,boardRadius+1):
			for k in range(-boardRadius,boardRadius+1):
				if i + j + k == 0:
					create_tile(i,j,k)

func create_tile(x:int,y:int,z:int):
	var newTile = tileRef.instantiate() as Tile
	newTile.position.x = (2 * y + x) * tileSize.x
	newTile.position.y = x * tileSize.y 
	newTile.coordinates = Vector3(x,y,z)
	add_child(newTile)
	tiles.append(newTile)

func get_tile(x:int,y:int,z:int):
	for i in tiles:
		if i.coordinates == Vector3(x,y,z):
			return i
	return false



func _ready() -> void:
	create_board()

func _process(_delta: float) -> void:
	pass
