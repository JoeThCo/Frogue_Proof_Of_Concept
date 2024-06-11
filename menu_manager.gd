extends Node

@export var main_menu: PackedScene = preload("res://UI/Menus/main_menu.tscn")
@export var battle_menu: PackedScene = preload("res://UI/Menus/battle.tscn")


func load_main_menu() -> void:
    get_tree().change_scene_to_packed(main_menu)
    

func load_battle() -> void:
    get_tree().change_scene_to_packed(battle_menu)
