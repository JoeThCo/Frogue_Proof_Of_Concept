extends Control
class_name BeingBattle


@export var battle_speed: float = .5

@export var player_grid: BeingGrid
@export var baddie_grid: BeingGrid


func _ready() -> void:
    BattleEventBus.battle_start.connect(on_battle_start)
    BattleEventBus.battle_end.connect(on_battle_end)
    
    BattleEventBus.player_win.connect(on_baddie_win)
    BattleEventBus.baddie_win.connect(on_player_win)
    
    BattleEventBus.is_winner = false
    BattleEventBus.is_battling = false
    
    
func on_baddie_win() -> void:
    to_main_menu()
    

func on_player_win() -> void:
    to_main_menu()


func to_main_menu() -> void:
    MenuManager.load_main_menu()
    
    
func on_battle_start():
    $HUD/Fight.visible = false


func on_battle_end():
    $HUD/Fight.visible = true


func _on_fight_button_up() -> void:
    print(str(player_grid.get_grid_total_speed()) + " vs " + str(baddie_grid.get_grid_total_speed()))
    var faster_grid: BeingGrid = null
    var slower_grid: BeingGrid = null
    
    #get faster grid
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

    print(slower_grid.name + " start!")
    await apply_abilities(slower_grid, faster_grid, BattleResources.WhenToTrigger.BeforeAttack)
    await battle(slower_grid, faster_grid)
    await apply_abilities(slower_grid, faster_grid, BattleResources.WhenToTrigger.AfterAttack)
    
    BattleEventBus.battle_end.emit()
    
     
func battle(first_grid: BeingGrid, second_grid: BeingGrid) -> void:
    for first_grid_slot in first_grid.alive_beings:
        check_battle_over()
        if BattleEventBus.is_winner: return
        await first_grid_slot.being_stats.battle_tween(second_grid.get_first(), battle_speed)
    check_battle_over()
        
    
func apply_abilities(first_grid: BeingGrid, second_grid: BeingGrid, when_to_trigger: BattleResources.WhenToTrigger) -> void:
    if BattleEventBus.is_winner: return
    for first_grid_slot: BeingSlot in first_grid.alive_beings:
        check_battle_over()
        if BattleEventBus.is_winner: return
        await first_grid_slot.being_stats.abilities.apply_abilitie_grid(first_grid_slot, first_grid, when_to_trigger) #check with self
    check_battle_over()
    
    
func check_battle_over() -> void:
    if baddie_grid.is_dead():
        print("Player wins!")
        BattleEventBus.player_win.emit()
    elif player_grid.is_dead():
        print("Baddie wins! Game Over!")
        BattleEventBus.baddie_win.emit()
