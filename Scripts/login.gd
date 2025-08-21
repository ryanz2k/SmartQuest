extends Control

func _on_sign_up_link_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Classification Screen.tscn")



func _on_forgot_password_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/ForgotPassword Screen.tscn")
