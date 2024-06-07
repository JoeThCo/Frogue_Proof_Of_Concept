extends Control


func _ready() -> void:
    $Version.text = ProjectSettings.get_setting("application/config/version", "X.Y.Z")


func _on_play_button_up() -> void:
    get_tree().change_scene_to_file("res://UI/Menus/game.tscn")
