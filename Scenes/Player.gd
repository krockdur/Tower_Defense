extends CanvasLayer

signal boutton_t1
signal boutton_t2
signal boutton_t3


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	pass

func _on_Button_t2_pressed():
	emit_signal("boutton_t2")


func _on_Button_t3_pressed():
	emit_signal("boutton_t3")


func _on_Button_t1_pressed():
	emit_signal("boutton_t1")
