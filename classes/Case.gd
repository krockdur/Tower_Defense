#Class case
#Représente une case

var m_position = Vector2()
var m_tourelle
const CASE_WIDTH = 100
const CASE_HEIGHT = 100

#constructeur :
#position => Vector2()
#tourelle => boolean / présence ou non d'une tourelle sur la case
func _init(position):
	self.m_position = position
	self.m_tourelle = false
	
	
func placer_tourelle():
	self.m_tourelle = true
	
func retirer_tourelle():
	self.m_tourelle = false
	
#case occupée ?
func get_statut():
	return self.m_tourelle
	
func get_position():
	return self.m_position
