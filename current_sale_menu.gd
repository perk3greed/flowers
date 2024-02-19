extends Control


var current_sale_object : sale
var new_text_int : int
var discount : bool
var final_price : int
var flower_array : Array = []
var current_flower_selected : String 
var flowers_amount : int 
var calculated_price : bool

@onready var default_sale_name = $name
@onready var default_sale_cost = $cost
@onready var default_sale_discount = $discount
@onready var default_sale_buket = $Buket
@onready var default_sale_kompositcia = $Kompositcia
@onready var flower_dict = FlowerDatabaseDictionary.flower_database_dict
@onready var amount_flowers = $amount_flowers
@onready var cost_counted_label = $cost_counted_label
@onready var dropdown = $OptionButton






func _ready():
	reset_sale()



func create_flowers_array():
	flower_array.clear()
	for flower in flower_dict:
		flower_array.append(flower)
	print("flower_array = ", flower_array)
		


func fill_dropdown_menu():
	dropdown.clear()
	for flower in flower_array:
		dropdown.add_item(flower)



func reset_sale():
	current_sale_object = sale.new()
	default_sale_name.text = ""
	default_sale_cost.text = ""
	default_sale_discount.button_pressed = false
	default_sale_buket.button_pressed = false
	default_sale_kompositcia.button_pressed = false
	dropdown.selected = -1
	cost_counted_label.text = ""
	amount_flowers.text = ""
	calculated_price = false
	



func write_info_on_sale():

	if calculated_price == false:
		if discount == false:
			current_sale_object.flower_type = default_sale_name.text
			current_sale_object.cost = new_text_int
		elif discount == true:
			current_sale_object.flower_type = default_sale_name.text
			var discounted_cost = new_text_int*0.93
			current_sale_object.cost = discounted_cost
			
	elif calculated_price == true:
		print(current_flower_selected)
		count_cost()
		current_sale_object.cost = final_price
		current_sale_object.flower_type = current_flower_selected
	
	current_sale_object.discount_active = discount
	

func _on_button_pressed():
	if default_sale_cost.text == "":
		calculated_price = true
	else :
		calculated_price = false
	write_info_on_sale()
	$"../../todays_sales".save_closed_sale(current_sale_object)
	reset_sale()
	

func _on_cost_text_changed(new_text):
	new_text_int = int(new_text)
	

func count_cost():
	
	var price_per_flower =  flower_dict[current_flower_selected]
	if discount == true:
		final_price = price_per_flower*flowers_amount*0.93
	else:
		final_price = price_per_flower*flowers_amount
	cost_counted_label.text = str(final_price)
	




func _on_discount_toggled(toggled_on):
	if toggled_on == false:
		discount = false

	elif toggled_on == true:
		discount = true

	


func _on_option_button_item_selected(index):
	current_flower_selected = flower_array[index]
	default_sale_cost.text = ""
	default_sale_name.text = ""

func _on_count_cost_pressed():
	default_sale_cost.text = ""
	default_sale_name.text = ""
	count_cost()


func _on_amount_flowers_text_changed(new_text):
	default_sale_cost.text = ""
	default_sale_name.text = ""
	flowers_amount = int(new_text)

#
#func _on_option_button_item_focused(index):
	#current_flower_selected = flower_array[index]
