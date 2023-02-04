extends Node2D

var rng

func get_random_face():
	var rand_boca = rng.randi_range(1,5)
	$Boca.texture = load("res://assets/mujer/boca/boca%s.png" % rand_boca)
	
	var rand_cara = rng.randi_range(1,5)
	$Cara.texture = load("res://assets/mujer/cara/cara%s.png" % rand_cara)
	
	var rand_nariz = rng.randi_range(1,5)
	$Nariz.texture = load("res://assets/mujer/nariz/nariz%s.png" % rand_nariz)
	
	var rand_ojos = rng.randi_range(1,5)
	$Ojos.texture = load("res://assets/mujer/ojos/ojos%s.png" % rand_ojos)
	
	var rand_pelo = rng.randi_range(1,5)
	$Pelo.texture = load("res://assets/mujer/pelo/pelo%s.png" % rand_pelo)

func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	get_random_face()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_random_face()
