extends Node2D


func _on_Face_face_pressed(face_id):
	print("TEST SIGNAL")
	$Book.visible = false
	$Siguiente.visible = false
	$Anterior.visible = false
	
	for face in $Faces.get_children():
		if face.id != face_id:
			face.visible = false
	



func _on_Face_face_not_pressed():
	print("TEST SIGNAL")
	$Book.visible = true
	$Siguiente.visible = true
	$Anterior.visible = true
	
	for face in $Faces.get_children():
		face.visible = true
	
