extends Node

func get_class_name(i):
	if i.get_script() != null:
		var className = i.get_script().get_global_name()
		return str(className)
	else:
		return ""
