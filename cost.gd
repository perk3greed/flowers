extends LineEdit




func _on_text_changed(new_text):
	var new_text_int = str(int(new_text))
	print(new_text_int)
