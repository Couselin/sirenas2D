extends Node2D
class_name Piece

@export var isAlly:bool = true
@export var life:int
@export var damage:int
##For allies only
@export var cost:int
##For enemies only
@export var movementRange:int

var tile:Tile
var direction:Vector3 = Vector3(0,0,0)
var tileOffset:Vector2 = Vector2(0,0)

func move():
	pass

func attack():
	pass

func cause_damage(target:Piece):
	target.take_damage(damage)

func take_damage(damageTaken:int):
	life -= damageTaken

func change_tile(new_tile:Tile):
	tile.isOccupied = false
	tile = new_tile
	tile.isOccupied = true
	reparent(tile)
	position = tileOffset

func set_direction(new_direction:Vector3):
	direction = new_direction

func _ready() -> void:
	tile = get_parent()
	tile.isOccupied = true
	position = tileOffset

func _process(delta: float) -> void:
	$LifeDisplay.text = str(life) #delete later
	pass
