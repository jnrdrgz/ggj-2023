extends Node2D


func _on_Face_face_pressed():
	print("TEST SIGNAL")
	$Book.visible = false
	$Siguiente.visible = false
	$Anterior.visible = false
	

