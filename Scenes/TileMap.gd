extends TileMap

var m_tileset
var Map = load("res://classes/Map.gd")
var map #la map chargée
export (PackedScene) var Case_vide

func _ready():
	m_tileset = get_tileset()
	
#	print(m_tileset.find_tile_by_name("ile_corner_bot_right"))
#	set_cellv(world_to_map(Vector2(100,100)), m_tileset.find_tile_by_name("ile_corner_bot_right"))
	
	map = Map.new(1)
	var x = 0
	var y = 0
	
	for ligne_tile in map.tab_map_file:
		for tile in ligne_tile:
			if tile != "":
				set_cellv(world_to_map(Vector2(x,y)), int(tile))
			x += 100
		x = 0
		y += 100
	
	#Affichage des cases tourelles
	for m_case in map.tab_case:
		var temp_case_vide = Case_vide.instance()
		temp_case_vide.position = m_case.m_position
		add_child(temp_case_vide)
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass








func back_up_map_id():
	var file = File.new()
	
	file.open("res://data/map/data.txt", file.WRITE)
    

	var tab_tiles = []
	tab_tiles = m_tileset.get_tiles_ids()
	var content = ""
	
	for tile in tab_tiles:
		content = content +"ID : " + str(tile) + "    NAME : " + str(m_tileset.tile_get_name(tile)) + "\r\n"
	
	file.store_string(content)
	file.close()
	
	
