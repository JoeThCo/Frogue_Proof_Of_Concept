extends Control
class_name AbilityInfoUI


func ability_info_init(ability: Ability) -> void:
    $VBoxContainer/BattleEvent.text = "BattleEvent: " + str(ability.battle_event)
    $VBoxContainer/Trigger.text = "Trigger: " + str(ability.trigger)
    $VBoxContainer/WhenToTrigger.text = "When: " + str(BattleResources.WhenToTrigger.keys()[ability.when_to_trigger])
