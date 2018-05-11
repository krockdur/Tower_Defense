extends PathFollow2D

export (float) var enemy_speed = 0.05

var identifiant = 0


func _ready():
	
	unit_offset = 0


func _process(delta):
	unit_offset = unit_offset + enemy_speed * delta
	$Mob_area2D/debug.text = "ID " + str(identifiant) + "\r\n" + str(position)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
