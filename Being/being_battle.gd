extends Control
class_name Being_Battle


@export var player_grid: Being_Grid
@export var baddie_grid: Being_Grid


func _on_fight_button_up() -> void:
    print(player_grid.get_grid_total_speed())
    print(baddie_grid.get_grid_total_speed())
    
