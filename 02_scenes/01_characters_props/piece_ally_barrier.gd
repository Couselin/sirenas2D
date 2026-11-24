extends "res://02_scenes/01_characters_props/piece.gd"

func take_damage(damageTaken:int):
	super.take_damage(damageTaken)
	if life <=0:
		tile.isOccupied = false
		queue_free()

func change_tile(new_tile:Tile):
	super.change_tile(new_tile)

func _ready() -> void:
	super._ready()

func _process(delta: float) -> void:
	super._process(delta)
