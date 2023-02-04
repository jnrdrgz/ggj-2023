extends Node2D

func createLine(from, to):
	$MyLine.add_point(from)
	$MyLine.add_point(to)

func removeLine():
	$MyLine.points = []

func _ready():
	pass
	#removeLine()
	#print($T1.global_position,$T1.global_position)
	#createLine(Vector2(0,0),Vector2(40,40))


func _draw():
	var color = Color(0, 0, 0, 1)
	draw_line($T1.global_position,$T2.global_position, color, 10.0)
	
	var a = Vector2($T1.global_position.x,$T1.global_position.y+200)
	var b = Vector2($T2.global_position.x,$T2.global_position.y+200)
	draw_line(a,b, color, 10.0)
	
	
	draw_line($T3.global_position,Vector2($T3.global_position.x,$T3.global_position.y-100), color, 10.0)
