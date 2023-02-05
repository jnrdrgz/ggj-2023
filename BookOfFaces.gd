extends Node2D

onready var faceScene = "res://Face.tscn"

var rng = RandomNumberGenerator.new()
var current_book = 0

#set_face(genero_, boca_, cara_, nariz_, ojos_, pelo_, nacionalidad_, profesion_):
var books = [
	[
		["hombre", 3, 4, 3, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 1, 2, 3, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 1, 4, 4, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 1, 1, 1, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],

		["hombre", 3, 4, 3, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 1, 2, 3, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 1, 4, 4, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 1, 1, 1, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],

		["hombre", 3, 4, 3, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 1, 2, 3, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 1, 4, 4, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 1, 1, 1, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],
	],
	[
		["hombre", 3, 4, 3, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 1, 2, 3, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 1, 4, 4, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 1, 1, 1, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],

		["hombre", 3, 4, 3, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 1, 2, 3, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 1, 4, 4, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 1, 1, 1, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],

		["hombre", 3, 4, 3, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 1, 2, 3, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 1, 4, 4, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 1, 3, 4, 2, 2, Global.nacionalidades[0], Global.profesiones[0]],
	],
	[
		["hombre", 1, 1, 2, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 1, 1, 3, 2, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 3, 4, 3, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 2, 4, 3, 2, 2, Global.nacionalidades[0], Global.profesiones[0]],

		["hombre", 3, 4, 3, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 2, 3, 1, 3, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 1, 4, 4, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 1, 4, 3, 2, 1, Global.nacionalidades[0], Global.profesiones[0]],

		["hombre", 3, 4, 4, 4, 1, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 1, 2, 2, 1, 4, Global.nacionalidades[0], Global.profesiones[0]],
		["mujer", 1, 4, 3, 4, 4, Global.nacionalidades[0], Global.profesiones[0]],
		["hombre", 1, 3, 2, 1, 1, Global.nacionalidades[0], Global.profesiones[0]],
	],
	
]

func next():
	var b = current_book + 1
	current_book = b
	
	print("next ", current_book, len(books))
	if b > len(books)-1:
		b = 0
		current_book = 0
	
	var book = books[b]
	$Book/Label.text = "%s de %s" % [b+1, len(books)]
	
	var child = 0
	for data in book:
		$Faces.get_children()[child].set_face(data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7])
		child += 1 

func previous():
	var b = current_book - 1
	current_book = b
	
	if b < 0:
		b = len(books)-1
		current_book = b
	print("previous ", current_book, len(books))
	
	var book = books[b]
	$Book/Label.text = "%s de %s" % [b+1, len(books)]

	var child = 0
	for data in book:
		$Faces.get_children()[child].set_face(data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7])
		child += 1 


func _ready():
	rng.randomize()
	for face in $Faces.get_children():
		face.get_random_face()
		
		face.connect("face_pressed", self, "_test")

func _test(face_id):
	print("TEST SIGNAL")
	$Book.visible = false
	$Siguiente.visible = false
	$Anterior.visible = false
	
	for face in $Faces.get_children():
		if face.id != face_id:
			face.visible = false
	

func _on_Face_face_pressed(face_id):
	print("TEST SIGNAL")
	$Book.visible = false
	$Siguiente.visible = false
	$Anterior.visible = false
	
	for face in $Faces.get_children():
		if face.id != face_id:
			face.visible = false
	

func show():
	visible = true
	$Book.visible = true
	$Siguiente.visible = true
	$Anterior.visible = true
	for face in $Faces.get_children():
		face.visible = true

func hide():
	visible = false
	#for face in $Faces.get_children():
	#	face.visible = true



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



func _on_Siguiente_pressed():
	next()

func _on_Anterior_pressed():
	previous()
