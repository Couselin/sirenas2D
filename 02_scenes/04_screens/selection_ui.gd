extends CanvasLayer
class_name SelectionUI

signal selection_finished

func _on_button_pressed() -> void:
	selection_finished.emit()
