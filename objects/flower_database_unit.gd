extends Control


func set_fdu(dict_key : String):
	$name.text = dict_key
	$cost.text = str(FlowerDatabaseDictionary.flower_database_dict[dict_key])
