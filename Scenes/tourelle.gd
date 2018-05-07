extends Area2D
export (PackedScene) var Shot

var activate = false 			#active / désactive la tourelle

var liste_mob_collision = [] 	#tableau des mobs en collision avec la tourelle
var liste_shot = []				#tableau contenant tous les tirs
var cible = Area2D 				#La cible des tirs (node supérieur Area2D)

func _ready():
#	$Timer_Debug.start()
	print("ready")
	$Timer_Fire.start()			#cadence des tirs
	
	#Trajectoire des tirs :
	$Path2D_fire.global_position = Vector2(0,0)	
	$Path2D_fire.curve.add_point(position)
	$Path2D_fire.curve.add_point(Vector2(0,0))

func _process(delta):
	if liste_mob_collision.size() != 0:
		$tourelle.look_at(liste_mob_collision[0].get_parent().position)
		cible = liste_mob_collision[0].get_parent()
		$tourelle.rotate(PI/2)
	else :
		$tourelle.rotation = 0
	
	#Vérifie si on doit éffacer un projectile
	_check_shot()
		

func _on_canon_area_entered(area):
	#Si un mob entre en collision avec la tourelle => ajout au tableau
	liste_mob_collision.append(area)
	


func _on_canon_area_exited(area):
	var i = 0
	var element_a_supprimer = 0
	
	#Si un mob quitte la zone de collision => suppression du tableau
	for m_area in liste_mob_collision:
		if m_area == area:
			liste_mob_collision.remove(i)
		i = i +1
		
	

func _on_Timer_Debug_timeout():
	$debug2.text = ""
	print("NB ligne liste_mob_collision : " + str(liste_mob_collision.size()))
	if liste_mob_collision.size() != 0 :
		var i = 0
		for m_area in liste_mob_collision:
			$debug2.text = $debug2.text + str(m_area.get_parent().identifiant) + str(m_area.get_parent().position) + "    " + str(liste_mob_collision[i].get_parent().position) + "\r\n"
			i = i + 1
			

func _create_path_fire():
	$Path2D_fire.curve.set_point_position(1, Vector2(liste_mob_collision[0].get_parent().position))
	var shot = Shot.instance()
	liste_shot.append(shot)
	$Path2D_fire.add_child(shot)

func _on_Timer_Fire_timeout():
	if liste_mob_collision.size() != 0:
		_create_path_fire()

func _check_shot():
	if liste_shot.size() > 0:
		for m_shot in liste_shot:
			if m_shot.unit_offset >= 1:
				m_shot.remove_and_skip()


func _on_canon_tree_entered():
	print ("enter tree")
		 
