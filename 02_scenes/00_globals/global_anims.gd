extends Node


func jump(sprite):
	var tween = create_tween()
	tween.tween_property(sprite, "scale", Vector2(0.9,1.1), 0.1)
	tween.parallel().tween_property(sprite, "position", Vector2(0,-10), 0.1)
	tween.tween_property(sprite, "scale", Vector2(1.1,0.9), 0.1)
	tween.parallel().tween_property(sprite, "position", Vector2(0,0), 0.1)
	tween.tween_property(sprite, "scale", Vector2(1,1), 0.1)
	'piece.scale = Vector2(0.98,1.08)
	await get_tree().create_timer(0.5).timeout
	piece.scale = Vector2(1,1)'
	pass
