@tool
extends EditorPlugin

func _enter_tree() -> void:
	add_autoload_singleton("quick", "res://addons/quick/quick.gd")

func _exit_tree() -> void:
	remove_autoload_singleton("quick")
