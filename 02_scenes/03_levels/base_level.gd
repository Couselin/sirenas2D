extends Node2D
class_name BaseLevel

var currentTurn: int = 0

@export var selectionUI: SelectionUI

enum phase {SELECTION, ALLY, ENEMY}
var currentPhase: phase = phase.SELECTION

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	activate_selection_ui()
	pass

func activate_selection_ui():
	currentTurn += 1
	print("TURNO: "+str(currentTurn))
	currentPhase = phase.SELECTION
	print("SELECTION PHASE")
	selectionUI.visible = true
	selectionUI.selection_finished.connect(desactivate_selection_ui)

func desactivate_selection_ui():
	selectionUI.visible = false
	move_allies()

func move_allies():
	currentPhase = phase.ALLY
	print("ALLY TURN")
	for child in get_children():
		if child.is_in_group("Ally"):
			child.move()
			await get_tree().create_timer(1).timeout
	move_enemies()

func move_enemies():
	currentPhase = phase.ENEMY
	print("ENEMY TURN")
	for child in get_children():
		if child.is_in_group("Enemy"):
			child.move()
			await get_tree().create_timer(1).timeout
	activate_selection_ui()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#this could be useful to change things visually according to the current phase
	#match currentPhase:
		#phase.SELECTION:
			#pass
		#phase.ALLY:
			#pass
		#phase.ENEMY:
			#pass
	pass
