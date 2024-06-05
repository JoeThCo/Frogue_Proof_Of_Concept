extends Control
class_name Being_Battle


@export var player_grid: Being_Grid
@export var baddie_grid: Being_Grid


func _ready() -> void:
    BattleEventBus.battle_start.connect(on_battle_start)
    BattleEventBus.battle_end.connect(on_battle_end)
    
    
func on_battle_start():
    $HUD/Fight.visible = false


func on_battle_end():
    $HUD/Fight.visible = true


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
    
    print(faster_grid.name + " start!")
    BattleEventBus.battle_start.emit()
    await battle(faster_grid, slower_grid)
    
    BattleEventBus.battle_half.emit()
    
    if is_battle_over(): return
    print(slower_grid.name + " start!")
    await battle(slower_grid, faster_grid)
    BattleEventBus.battle_end.emit()
        

func battle(first_grid: Being_Grid, second_grid: Being_Grid) -> void:
     for being_slot: Being_Slot in first_grid.alive_beings:
        await being_battle(being_slot, second_grid.get_first())
        if is_battle_over():
            get_battle_winner()
            break
    

func being_battle(a: Being_Slot, b: Being_Slot):
    await a.being_stats.battle_tween(b, 1)
    
    
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
        
