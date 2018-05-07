var m_map

func _init(map):
	print("constructeur")
	self.m_map = map
	
func afficher_map():
	print(str(self.m_map))