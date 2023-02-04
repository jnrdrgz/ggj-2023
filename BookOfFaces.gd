extends Node2D

onready var faceScene = "res://Face.tscn"

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
		

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
	

func get_random_face(genero):
	var face_object = load(faceScene)
	var face_object_instance = face_object.instance()

	face_object_instance.genero = genero

	var rand_boca = rng.randi_range(1,5)
	var rand_cara = rng.randi_range(1,5)
	var rand_nariz = rng.randi_range(1,5)
	var rand_ojos = rng.randi_range(1,5)
	var rand_pelo = rng.randi_range(1,5)

	
	face_object_instance.set_cara(rand_cara)
	face_object_instance.set_boca(rand_boca)
	face_object_instance.set_nariz(rand_nariz)
	face_object_instance.set_ojos(rand_ojos)
	face_object_instance.set_pelo(rand_pelo)

	face_object_instance.scale = Vector2(0.25,0.25)

func generate_faces(n):
	pass
