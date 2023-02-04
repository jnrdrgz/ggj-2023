extends Node2D

var genero = "hombre"
var nacionalidad = "argentina"
var profesion = "-"
var pressing = false
var face_not_pressed_signal_emitted = false
var original_pos
var rng
var id 

signal face_pressed(id)
signal face_not_pressed

func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	
	id = rng.randi()
	print(id)
	
	original_pos = global_position
	$Data/DataLabel.text = "Género: %s\n\nNacionalidad: %s\n\n Profesión: %s\n\n" % [genero, nacionalidad,profesion]

func set_genero(gen):
	genero = gen

func set_cara(cara):
	$Cara.texture = load("res://assets/%s/cara/cara%s.png" % [genero, cara])

func set_boca(boca):
	$Boca.texture = load("res://assets/%s/boca/boca%s.png" % [genero, boca])

func set_nariz(nariz):
	$Nariz.texture = load("res://assets/%s/nariz/nariz%s.png" % [genero, nariz])

func set_ojos(ojos):
	$Ojos.texture = load("res://assets/%s/ojos/ojos%s.png" % [genero, ojos])

func set_pelo(pelo):
	$Pelo.texture = load("res://assets/%s/pelo/pelo%s.png" % [genero, pelo])

func _input(event):
	pass

func zoom():
	$Ojos.scale = $Ojos.scale * 2;
	$Boca.scale = $Boca.scale * 2;
	$Nariz.scale = $Nariz.scale * 2;
	$Pelo.scale = $Pelo.scale * 2;
	$Cara.scale = $Cara.scale * 2;
func unzoom():
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


func _on_TextureRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		emit_signal("face_pressed", id)
		pressing = true
		face_not_pressed_signal_emitted = false
		print("pressed")
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		pressing = false
		global_position = original_pos

	#elif event is InputEventScreenTouch and event.pressed:
	#	print("test pressed")
	#	get_tree().set_input_as_handled()


