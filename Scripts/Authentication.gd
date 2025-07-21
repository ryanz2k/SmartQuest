extends Control

func _ready() -> void:
	# Connect authentication signals to generic handlers
	_connect_auth_signals()

func _connect_auth_signals() -> void:
	Firebase.Auth.login_succeeded.connect(_on_auth_succeeded.bind("Login"))
	Firebase.Auth.signup_succeeded.connect(_on_auth_succeeded.bind("Register"))
	Firebase.Auth.login_failed.connect(_on_auth_failed.bind("Login"))
	Firebase.Auth.signup_failed.connect(_on_auth_failed.bind("Register"))

func _on_login_button_pressed() -> void:
	var email: String = %EmailLineEdit.text
	var password: String = %PasswordLineEdit.text
	Firebase.Auth.login_with_email_and_password(email, password)
	%StateLabel.text = "Logging In"

func _on_register_button_pressed() -> void:
	var email: String = %EmailLineEdit.text
	var password: String = %PasswordLineEdit.text
	Firebase.Auth.signup_with_email_and_password(email, password)
	%StateLabel.text = "Registering"

# Generic handler for authentication success
func _on_auth_succeeded(action: String) -> Callable:
	return func(auth):
		print(auth)
		%StateLabel.text = "%s Success" % action

# Generic handler for authentication failure
func _on_auth_failed(action: String) -> Callable:
	return func(error_code, message):
		print(error_code)
		print(message)
		%StateLabel.text = "%s Failed: Error: %s" % [action, message]
	
