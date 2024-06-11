extends Control


func _ready() -> void:
    $Version.text = ProjectSettings.get_setting("application/config/version", "X.Y.Z")


func _on_play_button_up() -> void:
    MenuManager.load_battle()
