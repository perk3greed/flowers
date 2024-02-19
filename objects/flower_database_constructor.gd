extends Control

var fdu = load("res://objects/flower_database_unit.tscn")
var flower_name_input : String 
var flower_cost_input : int
var flow_dick = FlowerDatabaseDictionary.flower_database_dict


func _ready():
	pass


func append_database(flower_name):
	var fdu_inst = fdu.instantiate()
	$VBoxContainer.add_child(fdu_inst)
	fdu_inst.set_fdu(flower_name)


func _on_cost_text_changed(new_text):
	flower_cost_input = int(new_text)


func _on_name_text_changed(new_text):
	flower_name_input = str(new_text)



func _on_button_pressed():
	if flower_cost_input != 0:
		if flower_name_input != "":
			FlowerDatabaseDictionary.add_flowers(flower_name_input,flower_cost_input)
			append_database(flower_name_input)
	$name.text = ""
	$cost.text = ""
	flower_cost_input = 0
	flower_name_input = ""

func _on_button_2_pressed():
	var showed_entries = $VBoxContainer.get_child_count()
	for child in showed_entries:
		child.queue_free()
	
	var dict_size = flow_dick.size()
	for flower in dict_size:
		var flower_actual = flow_dick[flower]
