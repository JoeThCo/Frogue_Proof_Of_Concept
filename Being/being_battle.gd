extends Control
class_name Being_Battle


@export var player_grid: Being_Grid
@export var baddie_grid: Being_Grid


func _on_fight_button_up() -> void:
    print(str(player_grid.get_grid_total_speed()) + " vs " + str(baddie_grid.get_grid_total_speed()))
    var faster_grid: Being_Grid = null
    var slower_grid: Being_Grid = null
    
    if player_grid.get_grid_total_speed() >= baddie_grid.get_grid_total_speed():
        faster_grid = player_grid
        slower_grid = baddie_grid
    else:
        faster_grid = baddie_grid
        slower_grid = player_grid
        
    await battle(faster_grid, slower_grid)
    await battle(slower_grid, faster_grid)    
        

func battle(first_grid: Being_Grid, second_grid: Being_Grid) -> void:
     for being_slot: Being_Slot in first_grid.alive_beings:
        await deal_damage(being_slot, second_grid.get_first())
        if is_battle_over():
            get_battle_winner()
            break
    

func deal_damage(a: Being_Slot, b: Being_Slot):
    await a.being_stats.damage_tween(b, 1)
    
    
func is_battle_over() -> bool:
    return player_grid.is_dead() or baddie_grid.is_dead()
    

func get_battle_winner() -> void:
    if baddie_grid.is_dead():
        print("Player wins!")
        BattleEventBus.player_win.emit()
    elif player_grid.is_dead():
        print("Game Over!")
        BattleEventBus.baddie_win.emit()
    else:
        print("No one won! This is bad!")
        
