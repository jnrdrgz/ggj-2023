extends Node2D

var rng

func get_random_face():
	var rand_boca = rng.randi_range(1,5)
	var rand_cara = rng.randi_range(1,5)
	var rand_nariz = rng.randi_range(1,5)
	var rand_ojos = rng.randi_range(1,5)
	var rand_pelo = rng.randi_range(1,5)
	
	
