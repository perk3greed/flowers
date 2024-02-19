extends Control

 

func set_parameters(flower_type : String,sale_cost : int,discount_act : bool):
	$name.text = flower_type
	var cost_str = str(sale_cost)
	$cost.text = cost_str
	$discount.visible = discount_act
