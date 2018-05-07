extends Node2D

var Map = load("res://classes/Map.gd")
var map #la map chargée

export (PackedScene) var Mob
export (PackedScene) var tourelle

var compteur_mob = 0
var depart = 0.0

#var liste_tourelles = []
var temp_tourelle
var boutton_clicked = false

const SPRITE_WIDTH = 100
const SPRITE_HEIGHT = 100
const SCREEN_WIDTH = 1024
const SCREEN_HEIGHT = 768


func _ready():
	
	#Chargement de la map
	map = Map.new(1)
	
	$TimerPopMob.start()

func _process(delta):
	#Si on choisi une tourelle
	#la tourelle suit la souris en se déplassant par case
	if  boutton_clicked == true:
		var pos_tmp_tourelle_x = floor( get_viewport().get_mouse_position().x / SPRITE_WIDTH) * SPRITE_WIDTH
		var pos_tmp_tourelle_y = floor( get_viewport().get_mouse_position().y / SPRITE_HEIGHT) * SPRITE_HEIGHT		
		temp_tourelle.position = Vector2(pos_tmp_tourelle_x + SPRITE_WIDTH/2, pos_tmp_tourelle_y + SPRITE_HEIGHT/2)
	pass

#Fait pop les mob suivant timer
func _on_TimerPopMob_timeout():
	compteur_mob = compteur_mob + 1

	var mob = Mob.instance()
	mob.identifiant = compteur_mob
	$Path2D_chemin_mob.add_child(mob)
	
	if (compteur_mob == 3):
		$TimerPopMob.stop()


func _on_Player_boutton():
	print("boutton main")
	temp_tourelle = tourelle.instance()
	add_child(temp_tourelle)
	
	boutton_clicked = true
	
	
	
