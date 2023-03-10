extends Node2D

var rng = RandomNumberGenerator.new()

onready var faceScene = "res://Face.tscn"

var gen_positions = {
		"FamilyGen1": 0,
		"FamilyGen2": 0,
		"FamilyGen3": 0,
		"FamilyGen4": 0,
	}

var lines = []

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
	
	return face_object_instance
	
func add_to_gen(gen, face_object_instance):
	gen_positions[gen] += 100
	var gen_position = gen_positions[gen]
	face_object_instance.global_position.x = gen_position
	get_node(gen).add_child(face_object_instance)	
	
	return face_object_instance
	
func _draw():
	var color = Color(0, 0, 0, 1)
	
	for line in lines:
		draw_line(line[0],line[1], color, 10.0)
	
func _ready():
	rng.randomize()
	
	var father1 = get_random_face("hombre")
	var mother1 = get_random_face("mujer")

	var f = add_to_gen("FamilyGen1", father1 )
	var m = add_to_gen("FamilyGen1", mother1 )
	var center_scale = Vector2(128,128)*0.25
	lines.push_back([m.global_position+center_scale,f.global_position+center_scale])

	var son1 = get_random_face("hombre")
	var son2 = get_random_face("mujer")
	var son3 = get_random_face("hombre")
	var son4 = get_random_face("hombre")
	
	add_to_gen("FamilyGen2", son1 )
	add_to_gen("FamilyGen2", son2 )
	add_to_gen("FamilyGen2", son3 )
	add_to_gen("FamilyGen2", son4 )
