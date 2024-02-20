extends Control

var fdu = load("res://objects/flower_database_unit.tscn")
var flower_name_input : String 
var flower_cost_input : int
var flow_dick = FlowerDatabaseDictionary.flower_database_dict
var path_to_file = "C://Users/418/perk3greed/flower_saves/data.json"

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
	read_json_data()




func save_json_data():
	var json_data = JSON.stringify(flow_dick)
	var file_to_save = FileAccess.open(path_to_file, FileAccess.WRITE)
	file_to_save.store_string(json_data)
	

func read_json_data():
	var file_to_read = FileAccess.open(path_to_file, FileAccess.READ)
	var jason_read = JSON.parse_string(file_to_read.get_as_text())
	FlowerDatabaseDictionary.flower_database_dict =  jason_read
	flow_dick = FlowerDatabaseDictionary.flower_database_dict


func refresh_database_visual():
	for flower in flow_dick:
		append_database(flower)

func _on_reload_button_pressed():
	refresh_database_visual()
