extends Control
class_name BeingBattle


@export var battle_speed: float = .75

@export var player_grid: BeingGrid
@export var baddie_grid: BeingGrid


func _ready() -> void:
    BattleEventBus.battle_start.connect(on_battle_start)
    BattleEventBus.battle_end.connect(on_battle_end)
    
    
func on_battle_start():
    $HUD/Fight.visible = false


func on_battle_end():
    $HUD/Fight.visible = true


func _on_fight_button_up() -> void:
    print(str(player_grid.get_grid_total_speed()) + " vs " + str(baddie_grid.get_grid_total_speed()))
    var faster_grid: BeingGrid = null
    var slower_grid: BeingGrid = null
    
    if player_grid.get_grid_total_speed() >= baddie_grid.get_grid_total_speed():
        faster_grid = player_grid
        slower_grid = baddie_grid
    else:
        faster_grid = baddie_grid
        slower_grid = player_grid
    
    print(faster_grid.name + " start!")
    BattleEventBus.battle_start.emit()
    
    await apply_abilities(faster_grid, slower_grid, BattleResources.WhenToTrigger.BeforeAttack)
    await battle(faster_grid, slower_grid)
    await apply_abilities(faster_grid, slower_grid, BattleResources.WhenToTrigger.AfterAttack)
    
    BattleEventBus.battle_half.emit()
    if is_battle_over(): return

    print(slower_grid.name + " start!")
    await apply_abilities(slower_grid, faster_grid, BattleResources.WhenToTrigger.BeforeAttack)
    await battle(slower_grid, faster_grid)
    await apply_abilities(slower_grid, faster_grid, BattleResources.WhenToTrigger.AfterAttack)
    BattleEventBus.battle_end.emit()
        

func battle(first_grid: BeingGrid, second_grid: BeingGrid) -> void:
    for first_grid_slot in first_grid.alive_beings:
        await first_grid_slot.being_stats.battle_tween(second_grid.get_first(), battle_speed)
        if is_battle_over():
            get_battle_winner()
            break
    
    
func apply_abilities(first_grid: BeingGrid, second_grid: BeingGrid, when_to_trigger: BattleResources.WhenToTrigger) -> void:
    for first_grid_slot: BeingSlot in first_grid.alive_beings:
        await first_grid_slot.being_stats.abilities.apply_abilitie_grid(first_grid_slot, first_grid, when_to_trigger) #check with self
        await first_grid_slot.being_stats.abilities.apply_abilitie_grid(first_grid_slot, second_grid, when_to_trigger) #check with other
    
    
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
        
