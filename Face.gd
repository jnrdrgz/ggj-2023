extends Node2D

var genero = "hombre"
var nacionalidad = "argentina"
var profesion = "-"

func _ready():
	$Data/DataLabel.text = "Género: %s\n\nNacionalidad: %s\n\n Profesión: %s\n\n" % [genero, nacionalidad,profesion]

func set_genero(gen):
	genero = gen

func set_cara(cara):
	$Cara.texture = load("res://assets/%s/cara/cara%s.png" % [genero, cara])

func set_boca(boca):
	$Cara.texture = load("res://assets/%s/boca/boca%s.png" % [genero, boca])

func set_nariz(nariz):
	$Nariz.texture = load("res://assets/%s/nariz/nariz%s.png" % [genero, nariz])

func set_ojos(ojos):
	$Ojos.texture = load("res://assets/%s/ojos/ojos%s.png" % [genero, ojos])

func set_pelo(pelo):
	$Pelo.texture = load("res://assets/%s/pelo/pelo%s.png" % [genero, pelo])

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		print("test clicked")
	elif event is InputEventScreenTouch and event.pressed:
		print("test pressed")
		get_tree().set_input_as_handled()

func _on_TextureRect_mouse_entered():
	$Data.visible = true

func _on_TextureRect_mouse_exited():
	$Data.visible = false
