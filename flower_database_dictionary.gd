extends Node


var flower_database_dict : Dictionary = {
	
	
	
	
}



func add_flowers(flower_name : String, flower_cost : int):
	flower_database_dict[flower_name] = flower_cost
	print(flower_database_dict)


func delete_flowers():
	pass
