extends Node





func _on_check_button_toggled(toggled_on):
	if toggled_on == true:
		$Control.visible = false
		$main_control/current_sale.create_flowers_array()
		$main_control/current_sale.fill_dropdown_menu()
	else :
		$Control.visible = true




func save_today_sales():
	var sales_done = $todays_sales/sale_class_saves.get_child_count()
	for i in sales_done:
		var printable = $todays_sales/sale_class_saves.get_child(i)
		print(printable)


func parce_today_sales():
	var parced_dickt : Dictionary = {}
	var sales_done = $todays_sales/sale_class_saves.get_child_count()
	for i in sales_done:
		var parcable = $todays_sales/sale_class_saves.get_child(i)
		
	


#
#func save_json_data():
	#var json_data = JSON.stringify(flow_dick)
	#var file_to_save = FileAccess.open(path_to_file, FileAccess.WRITE)
	#file_to_save.store_string(json_data)
	#




func _on_button_pressed():
	save_today_sales()
