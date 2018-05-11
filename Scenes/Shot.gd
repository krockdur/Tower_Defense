extends PathFollow2D

export (float) var speed

func _ready():
	unit_offset = 0

func _process(delta):
	unit_offset = unit_offset + speed * delta



func _on_Area2D_shot_area_entered(area):
	if area.get_name() == "Mob_area2D":
		queue_free()
