extends Area2D
export (PackedScene) var Shot

var activate = false 			#active / désactive la tourelle

var liste_mob_collision = [] 	#tableau des mobs en collision avec la tourelle
var liste_shot = []				#tableau contenant tous les tirs

var shot_curve = Curve2D.new()	#path shot


func _ready():
	print("ready")
	$Timer_Fire.start()			#cadence des tirs
	
	#Trajectoire des tirs :	
	shot_curve.add_point(position)
	shot_curve.add_point(Vector2(0,0))
	$Path2D_fire.curve = shot_curve
	$Path2D_fire.global_position = Vector2(0,0)

func _process(delta):
	if liste_mob_collision.size() != 0:
		$tourelle.look_at(liste_mob_collision[0].get_parent().position)
		$tourelle.rotate(PI/2)
	else :
		$tourelle.rotation = 0

		

#collision mob / tourelle
func _on_canon_area_entered(area):
	#Si un mob entre en collision avec la tourelle => ajout au tableau
	if area.get_name() == "Mob_area2D":
		liste_mob_collision.append(area)
	

#ennemi quitte area tourelle
func _on_canon_area_exited(area):
	if area.get_name() == "Mob_area2D":
	
		var i = 0
		var element_a_supprimer = 0
		
		#Si un mob quitte la zone de collision => suppression du tableau
		for m_area in liste_mob_collision:
			if m_area == area:
				liste_mob_collision.remove(i)
			i = i +1
			
#Timer de tir
func _on_Timer_Fire_timeout():
	if liste_mob_collision.size() != 0:
		$Path2D_fire.curve.set_point_position(1, Vector2(liste_mob_collision[0].get_parent().position))
		var shot = Shot.instance()
		liste_shot.append(shot)
		$Path2D_fire.add_child(shot)
		$debug.text = "FEU"
	else:
		$debug.text = ""

