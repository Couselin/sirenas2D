extends Node2D
class_name Piece

@export var isAlly:bool = true
@export var life:int
@export var damage:int
@export var cost:int

var tile:Tile
var direction:Vector3
var tileOffset:Vector2 = (Vector2(0,0))

func move():
	pass

func attack():
	pass

func cause_damage(target:Piece):
	target.take_damage(damage)

func take_damage(damageTaken:int):
	life -= damageTaken
	if life <=0:
		pass
	pass

func change_tile(new_tile:Tile):
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
	$LifeDisplay.text = str(life) #delete later
	pass
