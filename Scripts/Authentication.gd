extends Control

func _ready():
	Firebase.Auth.login_succeeded.connect(on_login_succeeded)
	Firebase.Auth.signup_succeeded.connect(on_register_succeeded)
	Firebase.Auth.login_failed.connect(on_login_failed)
	Firebase.Auth.signup_failed.connect(on_register_failed)
	
func _on_login_button_pressed() -> void:
	var email = %EmailLineEdit.text
	var password = %PasswordLineEdit.text
	Firebase.Auth.login_with_email_and_password(email, password)
	%StateLabel.text = "Logging In"
	
func _on_register_button_pressed() -> void:
	var email = %EmailLineEdit.text
	var password = %PasswordLineEdit.text
	Firebase.Auth.signup_with_email_and_password(email, password)
	%StateLabel.text = "Registering"
	
func on_login_succeeded(auth):
	print(auth)
	%StateLabel.text = "Login Success"
	
	
func on_register_succeeded(auth):
	print(auth)
	%StateLabel.text = "Register Success"
	
func on_login_failed(error_code, message):
	print(error_code)
	print(message)
	%StateLabel.text = "Login Failed: Error: %s" %message
	
	
func on_register_failed(error_code, message):
	print(error_code)
	print(message)
	%StateLabel.text = "Register Failed: Error: %s" %message
