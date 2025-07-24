extends Control


func _on_sign_up_link_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Login Screen.tscn")
