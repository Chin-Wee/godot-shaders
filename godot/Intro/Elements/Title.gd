extends Label

func change_title(title: String) -> void:
	var tween := create_tween()
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 0.15)
	await tween.finished
	text = title
	tween = create_tween()
	tween.tween_property(self, "modulate", Color.WHITE, 0.15)
