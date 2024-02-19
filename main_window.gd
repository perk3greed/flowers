extends Node





func _on_check_button_toggled(toggled_on):
	if toggled_on == true:
		$Control.visible = false
		$main_control/current_sale.create_flowers_array()
		$main_control/current_sale.fill_dropdown_menu()
	else :
		$Control.visible = true
