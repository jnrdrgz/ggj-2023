extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("show_book"):
		if not $BookOfFaces.visible:
			$BookOfFaces.show()
		else:
			$BookOfFaces.hide()
