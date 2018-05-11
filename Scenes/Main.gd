extends Node2D

var Map = load("res://classes/Map.gd")
var map #la map chargée

export (PackedScene) var Mob
export (PackedScene) var tourelle
export (PackedScene) var Case_vide

var compteur_mob = 0
var depart = 0.0

var liste_tourelles = []
var boutton_clicked = false
var type_tourelle_select = 0

const SPRITE_WIDTH = 100
const SPRITE_HEIGHT = 100



func _ready():
	
	#Chargement de la map
	map = Map.new(1)
	
	for m_case in map.tab_case:
		var temp_case_vide = Case_vide.instance()
		temp_case_vide.position = m_case.m_position
		add_child(temp_case_vide)
		
	
	$TimerPopMob.start()

func _process(delta):
	#Si on choisi une tourelle
	#la tourelle suit la souris en se déplassant par case
#	if  boutton_clicked == true:
#		var pos_tmp_tourelle_x = floor( get_viewport().get_mouse_position().x / SPRITE_WIDTH) * SPRITE_WIDTH
#		var pos_tmp_tourelle_y = floor( get_viewport().get_mouse_position().y / SPRITE_HEIGHT) * SPRITE_HEIGHT		
#		temp_tourelle.position = Vector2(pos_tmp_tourelle_x + SPRITE_WIDTH/2, pos_tmp_tourelle_y + SPRITE_HEIGHT/2)
	pass

#Fait pop les mob suivant timer
func _on_TimerPopMob_timeout():
	compteur_mob = compteur_mob + 1

	var mob = Mob.instance()
	mob.identifiant = compteur_mob
	$Path2D_chemin_mob.add_child(mob)
	
	if (compteur_mob == 3):
		$TimerPopMob.stop()

func _on_Player_boutton_t1():
	type_tourelle_select = 1


func _on_Player_boutton_t2():
	type_tourelle_select = 2


func _on_Player_boutton_t3():
	type_tourelle_select = 3

func _input(event):
	if not event.is_action_pressed('click_gauche'):
		return
	print("click position : " + str(get_local_mouse_position()))
	
	var mouse_position = get_local_mouse_position()
	
	for m_case in map.tab_case:
		#print (m_case.m_position)
		if (mouse_position.x >= m_case.m_position.x) and (mouse_position.x <= m_case.m_position.x + m_case.CASE_WIDTH) and (mouse_position.y >= m_case.m_position.y) and (mouse_position.y <= m_case.m_position.y + m_case.CASE_HEIGHT):
			print("ok")
			var temp_tourelle
			temp_tourelle = tourelle.instance()
			temp_tourelle.position.x = m_case.m_position.x + m_case.CASE_WIDTH / 2
			temp_tourelle.position.y = m_case.m_position.y + m_case.CASE_HEIGHT / 2
			add_child(temp_tourelle)
			liste_tourelles.append(temp_tourelle)
	