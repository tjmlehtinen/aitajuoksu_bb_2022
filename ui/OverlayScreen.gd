extends Control

signal dismissed

func _on_Button_pressed():
	emit_signal("dismissed")
	hide()
