extends Node

var closed_sale_container = preload("res://objects/closed_sale_object.tscn")

func save_closed_sale(closed_sale : sale):
	var flower_name = closed_sale.flower_type
	var sale_cost = closed_sale.cost
	var discount_act = closed_sale.discount_active
	var cloased_sale_instance = closed_sale_container.instantiate()
	$Control/VBoxContainer.add_child(cloased_sale_instance)
	cloased_sale_instance.set_parameters(flower_name,sale_cost,discount_act)
	
