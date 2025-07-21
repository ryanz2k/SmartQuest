extends Control

# This function is called when the Login button is pressed
func _on_login_button_pressed():
	# Get the text from the input fields
	var email = $Email/EmailInput.text
	var password = $Password/PasswordInput.text
	
	# Print the values to the output console for testing
	print("Login button pressed!")
	print("Email: ", email)
	print("Password: ", password)

# This function is called when the Register button is pressed
func _on_register_button_pressed():
	# Get the text from the input fields
	var email = $Email/EmailInput.text
	var password = $Password/PasswordInput.text

	# Print the values to the output console for testing
	print("Register button pressed!")
	print("Email: ", email)
	print("Password: ", password)
