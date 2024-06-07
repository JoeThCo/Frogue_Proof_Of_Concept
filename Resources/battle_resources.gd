extends Node


var all_triggers: Array[Trigger]
var all_battle_events: Array[BattleEvent]


const TRIGGER_PATH: String = "res://Resources/Triggers/"
const BATTLE_EVENT_PATH: String = "res://Resources/BattleEvent/"


func _ready() -> void:
    load_triggers()
    load_battle_events()


func load_triggers() -> void:
    for file_name in DirAccess.get_files_at(TRIGGER_PATH):
        var trigger: Trigger = load(TRIGGER_PATH + file_name).new() as Trigger
        all_triggers.append(trigger)
        
        
func load_battle_events() -> void:
    for file_name in DirAccess.get_files_at(BATTLE_EVENT_PATH):
        var battle_event: BattleEvent = load(BATTLE_EVENT_PATH + file_name).new() as BattleEvent
        all_battle_events.append(battle_event)
        

func get_random_trigger() -> Trigger:
    return all_triggers.pick_random() as Trigger
    

func get_random_battle_event() -> BattleEvent:
    return all_battle_events.pick_random() as BattleEvent
