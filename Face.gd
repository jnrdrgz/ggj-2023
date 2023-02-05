extends Node2D

var genero = "hombre"
var nacionalidad = "argentina"
var profesion = "-"
var pressing = false
var face_not_pressed_signal_emitted = false
var original_pos
var rng
var id 

var cara
var boca
var nariz
var ojos
var pelo


var original_scale

signal face_pressed(id)
signal face_not_pressed
signal released(face)

var face_inside = false

export (bool) var is_incognito = false
export (bool) var generate_randomly = false

func get_random_face():
	var len_profesiones = len(Global.profesiones)
	var prof = rng.randi_range(0,len_profesiones-1)
	profesion = Global.profesiones[prof]
	print("profesion", profesion)
	
	var rand_boca = rng.randi_range(1,5)
	set_boca(rand_boca)
	
	var rand_cara = rng.randi_range(1,5)
	set_cara(rand_cara)
	
	var rand_nariz = rng.randi_range(1,5)
	set_nariz(rand_nariz)
	
	var rand_ojos = rng.randi_range(1,5)
	set_ojos(rand_ojos)
	
	var rand_pelo = rng.randi_range(1,5)
	set_pelo(rand_pelo)
	
	$Data/DataLabel.text = "Género: %s\n\nNacionalidad: %s\n\n Profesión: %s\n\n" % [genero, nacionalidad,profesion]

func set_face(genero_, boca_, cara_, nariz_, ojos_, pelo_, nacionalidad_, profesion_):
	nacionalidad = nacionalidad_
	genero = genero_
	profesion = profesion_
	set_boca(boca_)
	set_cara(cara_)
	set_nariz(nariz_)
	set_ojos(ojos_)
	set_pelo(pelo)
	
	$Data/DataLabel.text = "Género: %s\n\nNacionalidad: %s\n\n Profesión: %s\n\n" % [genero, nacionalidad, profesion]


func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	
	id = rng.randi()
	print(id)
	
	
	original_scale = scale
	
	original_pos = global_position
	$Data/DataLabel.text = "Género: %s\n\nNacionalidad: %s\n\n Profesión: %s\n\n" % [genero, nacionalidad,profesion]
	
	if generate_randomly:
		get_random_face()
	
	if is_incognito:
		$Incognito.visible = true
		
		$Cara.visible = false
		$Boca.visible = false
		$Nariz.visible = false
		$Ojos.visible = false
		$Pelo.visible = false
	
func set_genero(gen):
	genero = gen

func set_cara(prop_cara):
	cara = prop_cara
	$Cara.texture = load("res://assets/%s/cara/cara%s.png" % [genero, prop_cara])

func set_boca(prop_boca):
	boca = prop_boca
	$Boca.texture = load("res://assets/%s/boca/boca%s.png" % [genero, prop_boca])

func set_nariz(prop_nariz):
	nariz = prop_nariz
	$Nariz.texture = load("res://assets/%s/nariz/nariz%s.png" % [genero, nariz])

func set_ojos(prop_ojos):
	ojos = prop_ojos
	$Ojos.texture = load("res://assets/%s/ojos/ojos%s.png" % [genero, prop_ojos])

func set_pelo(prop_pelo):
	pelo = prop_pelo
	$Pelo.texture = load("res://assets/%s/pelo/pelo%s.png" % [genero, pelo])

func _input(event):
	pass

func zoom():
	if not ($Ojos.scale == original_scale * 2):
		$Ojos.scale = $Ojos.scale * 2;
		$Boca.scale = $Boca.scale * 2;
		$Nariz.scale = $Nariz.scale * 2;
		$Pelo.scale = $Pelo.scale * 2;
		$Cara.scale = $Cara.scale * 2;

func unzoom():	
	print($Ojos.scale, original_scale / 2)
	if not ($Ojos.scale == original_scale / 2):
		$Ojos.scale = $Ojos.scale / 2;
		$Boca.scale = $Boca.scale / 2;
		$Nariz.scale = $Nariz.scale / 2;
		$Pelo.scale = $Pelo.scale / 2;
		$Cara.scale = $Cara.scale / 2;

func _on_TextureRect_mouse_entered():
	$Data.visible = true
	zoom()


func _on_TextureRect_mouse_exited():
	$Data.visible = false
	unzoom()

func _process(delta):
	if pressing:
		var mouse_pos = get_viewport().get_mouse_position()
		global_position = Vector2(mouse_pos.x-50,mouse_pos.y-50) 
	
	if not pressing:
		if not face_not_pressed_signal_emitted:
			emit_signal("face_not_pressed")
			face_not_pressed_signal_emitted = true

func unselect():
	pressing = false
	global_position = original_pos

func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		emit_signal("face_pressed", id)
		pressing = true
		face_not_pressed_signal_emitted = false
		print("pressed")
		#unzoom()
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		unselect()
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		print("REALESED")
		if face_inside:
			print("FACE INSIDE")
			emit_signal("released", self)

	#elif event is InputEventScreenTouch and event.pressed:
	#	print("test pressed")
	#	get_tree().set_input_as_handled()


func clone(face):
	genero = face.genero
	nacionalidad = face.nacionalidad
	profesion = face.profesion
	
	set_boca(face.boca)
	set_cara(face.cara)
	set_nariz(face.nariz)
	set_ojos(face.ojos)
	set_pelo(face.pelo)
	
	#is_incognito = false
	
	$Incognito.visible = false
	
	$Cara.visible = true
	$Boca.visible = true
	$Nariz.visible = true
	$Ojos.visible = true
	$Pelo.visible = true


func _test(face):
	print("TTTTTTTTTESt")
	clone(face)

func _on_Area_area_entered(area):
	var face =  area.get_parent() 
	
	if is_incognito:
		face.face_inside = true
		face.connect("released", self, "_test")
		#clone(face)
		#face.unselect()



func _on_Area_area_exited(area):
	var face =  area.get_parent() 
	
	if is_incognito:
		face.face_inside = false
		face.disconnect("released", self, "_test")
