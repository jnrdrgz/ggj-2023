extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("show_book"):
		$BookOfFaces.visible = not $BookOfFaces.visible
