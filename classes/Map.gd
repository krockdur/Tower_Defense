var Case = load("res://classes/Case.gd")


var tab_case = [] #liste des case d'une map
var lvl           #numéro du level

func _init(level):
	self.lvl = level
	
	self.creer_map()
	

func creer_map():
	if self.lvl == 1:
		self.tab_case.append(Case.new(Vector2(200,200)))
		self.tab_case.append(Case.new(Vector2(300,200)))
		self.tab_case.append(Case.new(Vector2(400,400)))
		self.tab_case.append(Case.new(Vector2(600,100)))
		self.tab_case.append(Case.new(Vector2(600,300)))


func test_emplacement(position):
	for test_case in tab_case:
		if position == test_case.get_position():
			if test_case.get_statut() == true:
				return true
			else:
				return false