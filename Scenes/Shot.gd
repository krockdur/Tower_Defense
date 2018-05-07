extends PathFollow2D

export (float) var speed

func _ready():
	unit_offset = 0

func _process(delta):
	unit_offset = unit_offset + speed * delta
