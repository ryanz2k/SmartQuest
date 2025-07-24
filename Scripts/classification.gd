extends Control



# This function is for the "account?" button
func _on_login_link_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Login Screen.tscn")

# This function is for the "PUPILS" button
func _on_pupils_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/RegisterPupil.tscn")

# This function is for the "PARENT" button
func _on_parents_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/RegisterParent.tscn")

# This function is for the "MODULE CREATOR" button
func _on_module_creator_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/RegisterModuleCreator.tscn")
