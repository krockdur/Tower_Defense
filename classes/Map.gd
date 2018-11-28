var Case = load("res://classes/Case.gd")

var tab_map_file = []
var tab_case = [] #liste des case d'une map
var lvl           #numéro du level

func _init(level):
	self.lvl = level
	
	load_map("lvl1")
	
	self.creer_map()
	
	
	

func creer_map():
	
	if self.lvl == 1:
		self.tab_case.append(Case.new(Vector2(200,0)))
		self.tab_case.append(Case.new(Vector2(300,0)))
		self.tab_case.append(Case.new(Vector2(400,0)))
		
		self.tab_case.append(Case.new(Vector2(200,200)))
		self.tab_case.append(Case.new(Vector2(300,200)))
		self.tab_case.append(Case.new(Vector2(400,200)))
		

		self.tab_case.append(Case.new(Vector2(600,300)))


func test_emplacement(position):
	for test_case in tab_case:
		if position == test_case.get_position():
			if test_case.get_statut() == true:
				return true
			else:
				return false
				
func load_map(map_file):
	var path = "res://data/map/" + map_file + ".tw"
	
	var file = File.new()
	file.open(path, file.READ)
#	var content = file.get_as_text()
	
	var content = []
	
	for i in range(8):
		content = file.get_csv_line()
		tab_map_file.append(content)
	
	file.close()
	
	
func convert_tile_id_name(id):
	if id ==  0 : return "ile_corner_top_left"
	if id ==  1 : return "ile_border_top"
	if id ==  2 : return "ile_corner_top_right"
	if id ==  3 : return "ile_border_left"
	if id ==  4 : return "ile_center"
	if id ==  5 : return "ile_border_right"
	if id ==  6 : return "ile_corner_bot_left"
	if id ==  7 : return "ile_border_bot"
	if id ==  8 : return "ile_corner_bot_right"
	if id ==  9 : return "ile_mini"
	if id == 10 : return "mer_mini"
	if id == 11 : return "mer"
	if id == 12 : return "rocher_mini"
	if id == 13 : return "mer_maxi_corner_top_left"
	if id == 14 : return "mer_maxi_corner_bot_left"
	if id == 15 : return "mer_maxi_corner_bot_right"
	if id == 16 : return "mer_maxi_corner_top_right"
	if id == 17 : return "mer_maxi_border_left"
	if id == 18 : return "mer_maxi_border_right"
	if id == 19 : return "mer_maxi_border_top"
	if id == 20 : return "mer_maxi_border_bot"
	if id == 21 : return "mer_maxi_center"
	
func convert_tile_name_id(name):
	if name == "ile_corner_top_left" : return 0
	if name == "ile_border_top" : return 1
	if name == "ile_corner_top_right" : return 2
	if name == "ile_border_left" : return 3
	if name == "ile_center" : return 4
	if name == "ile_border_right" : return 5
	if name == "ile_corner_bot_left" : return 6
	if name == "ile_border_bot" : return 7
	if name == "ile_corner_bot_right" : return 8
	if name == "ile_mini" : return 9
	if name == "mer_mini" : return 10
	if name == "mer" : return 11
	if name == "rocher_mini" : return 12
	if name == "mer_maxi_corner_top_left" : return 13
	if name == "mer_maxi_corner_bot_left" : return 14
	if name == "mer_maxi_corner_bot_right" : return 15
	if name == "mer_maxi_corner_top_right" : return  16
	if name == "mer_maxi_border_left" : return 17
	if name == "mer_maxi_border_right" : return 18
	if name == "mer_maxi_border_top" : return 19
	if name == "mer_maxi_border_bot" : return  20
	if name == "mer_maxi_center" : return 21
