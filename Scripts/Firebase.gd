# Firebase.gd
extends Node

func _ready():
	# The addon will now automatically read the .env file.
	# We just need to initialize the modules.
	Firebase.Auth.initialize("auth")
	Firebase.Firestore.initialize("firestore")
	Firebase.Storage.initialize("storage")
	
	print("Firebase GDScript Modules Initialized from .env file")
